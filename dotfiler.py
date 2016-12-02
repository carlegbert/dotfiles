import sys
from shutil import copyfile
from os import environ, path


def read_config():
    cfg = open('.dfconfig', 'r')
    for line in cfg:
        l = line.rstrip()
        if len(l) > 0 and l[0] != '#':
            yield l
    cfg.close()


def get_dotfiles():
    tracked_files = read_config()
    homedir = environ['HOME']
    for dotfile in tracked_files:
        src = path.join(homedir, dotfile)
        copyfile(src, dotfile)


def set_dotfiles():
    tracked_files = read_config()
    homedir = environ['HOME']
    for dotfile in tracked_files:
        dest = path.join(homedir, dotfile)
        copyfile(dotfile, dest)


if len(sys.argv) < 2 or (sys.argv[1] != 'get' and sys.argv[1] != 'set'):
    print("Useage: '$ ./dotfiler.py get' or '$ ./dotfiler.py set'")
    sys.exit()
elif sys.argv[1] == 'get':
    get_dotfiles()
elif sys.argv[1] == 'set':
    set_dotfiles()
