#!/usr/bin/env python

import sys
from shutil import copyfile
from os import environ, path, listdir, mkdir
import config


HOMEDIR = environ['HOME']
BACKUP_DIR = path.join(HOMEDIR, "dotfiles")
TRACKED_FILES = config.get_tracked_files()


def get_dotfiles():
    """
    retrieve all files listed in dotfiler.ini to ~/dotfiler/
    """
    for filetuple in TRACKED_FILES:
        filename = filetuple[0]
        filepath = filetuple[1]
        get_dotfile(filename, filepath)
    if len(TRACKED_FILES) == 0:
        print("No entries found in dotfiler.ini")


def set_dotfiles():
    """
    copy all files listed in dotfiler.ini from ~/dotfiler/
    """
    for filetuple in TRACKED_FILES:
        filename = filetuple[0]
        filepath = filetuple[1]
        set_dotfile(path.expanduser(filename), filepath=filepath)
    if len(TRACKED_FILES) == 0:
        print("No entries found in dotfiler.ini")


def get_dotfile(filename, filepath, subdirs=None, addcfg=True):
    """
    add individual file to ~/dotfiler.
    TODO: refactor this + get_individual_dotfile into same function.. probably?
    at least rename them
    """
    if subdirs:
        dest = path.join(BACKUP_DIR, subdirs, filename)
    else:
        dest = path.join(BACKUP_DIR, filename)
    if path.exists(filepath):
        if path.isdir(filepath):
            get_dir(filename, filepath, subdirs, addcfg=addcfg)
        else:
            copyfile(filepath, dest)
        print("Success: {} copied to {}".format(filepath, dest))
    else:
        print("Error: file {} not found".format(filepath))


def get_individual_dotfile(arg, subdirs=None, addcfg=True):
    """
    parse filepath into filename and filepath, then call
    get_dotfile() to add it to ~/dotfiler.
    eg, can be called for files not already tracked in dotfiler.ini.

    """
    filepath = path.abspath(path.expanduser(arg))
    filename = path.basename(filepath)
    get_dotfile(filename, filepath, subdirs, addcfg=addcfg)

    if addcfg and filepath not in TRACKED_FILES:
        config.add_file(filepath)


def set_dotfile(filename, filepath=None, subdirs=None, addcfg=True):
    """
    copy individual file to ~/dotfiler.
    begin tracking it in dotfiler.ini if it's not listed there already
    if it's a dir, mkdir if it doesn't exist already
    """
    if subdirs:
        src = path.join(BACKUP_DIR, subdirs, filename)
    else:
        src = path.join(BACKUP_DIR, filename)
    if not filepath:
        filepath = config.get_filepath(filename)
    if path.exists(src):
        if path.isdir(src):
            set_dir(filename, dirpath=filepath, subdirs=subdirs)
        else:
            copyfile(src, filepath)
            print("Success: {} copied to {}".format(src, filepath))
        if addcfg and filename not in TRACKED_FILES:
            config.add_file(filepath)
    else:
        print("Error: {} not found in {}".format(src, BACKUP_DIR))


def set_dir(dirname, dirpath=None, subdirs=None):
    """
    create corresponding dir from backup dir if it doesn't exist.
    copy all contents from backup dir to real dir.
    """
    if subdirs:
        src = path.join(BACKUP_DIR, subdirs, dirname)
    else:
        src = path.join(BACKUP_DIR, dirname)

    if not dirpath:
        dirpath = config.get_filepath(dirname)

    if not path.exists(dirpath):
        mkdir(dirpath)

    for f in listdir(src):
        if subdirs:
            new_subdirs = path.join(subdirs, dirname)
        else:
            new_subdirs = dirname
        fpath = path.join(dirpath, f)
        set_dotfile(f, filepath=fpath, subdirs=new_subdirs, addcfg=False)


def get_dir(dirname, dirpath, subdirs=None, addcfg=True):
    """
    recursively copy a dir and all of its contents to ~/dotfiles
    """
    if subdirs:
        dest = path.join(BACKUP_DIR, subdirs, dirname)
    else:
        dest = path.join(BACKUP_DIR, dirname)
    if not path.exists(dest):
        mkdir(dest)
    if addcfg and dirpath not in TRACKED_FILES:
        config.add_file(dirpath)
    for f in listdir(dirpath):
        if subdirs:
            new_subdirs = path.join(subdirs, dirname)
        else:
            new_subdirs = dirname
        get_individual_dotfile(path.join(dirpath, f),
                               new_subdirs, addcfg=False)


if __name__ == "__main__":
    if len(sys.argv) < 2 or (sys.argv[1] != 'get' and sys.argv[1] != 'set'):
        print("Useage: '$ python dotfiler.py get/set "
              "[any # of optional filepaths]'")
        sys.exit()
    elif sys.argv[1] == 'get':
        if len(sys.argv) > 2:
            for filepath in sys.argv[2:]:
                get_individual_dotfile(filepath)
        else:
            get_dotfiles()
    elif sys.argv[1] == 'set':
        if len(sys.argv) > 2:
            for filename in sys.argv[2:]:
                set_dotfile(filename)
        else:
            set_dotfiles()
