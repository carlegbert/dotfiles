import configparser
from os import path, environ, mkdir, listdir
from shutil import copyfile


HOMEDIR = environ["HOME"]
DIRPATH = path.join(HOMEDIR, "dotfiles")
APPDIR = path.join(DIRPATH, "dotfiler")
CFGPATH = path.join(APPDIR, "dotfiler.ini")


def create_config():
    """
    initialize dotfiler.ini
    """
    config = configparser.ConfigParser()
    config.add_section("Files")
    with open(CFGPATH, "w") as config_file:
        config.write(config_file)



def get_config():
    """
    returns config object from dotfiler.ini
    """
    if not path.exists(CFGPATH):
        create_config()

    config = configparser.ConfigParser()
    config.read(CFGPATH)
    return config


def add_file(filepath):
    """
    begin tracking new file in dotfiler.ini
    TODO: deal with files with duplicate basenames
    """
    config = get_config()
    file_alias = path.basename(filepath)
    config.set("Files", file_alias, filepath)
    with open(CFGPATH, "w") as config_file:
        config.write(config_file)


def get_tracked_files():
    """
    get all files tracked in dotfiler.ini.
    :return: List of tuples
    """
    return get_config().items("Files")


def get_filepath(filename):
    """
    get full path for file in dotfiler.ini by its name
    """
    return get_config().get("Files", filename)


def install():
    """
    create ~/dotfiles/, ~/dotfiles/dotfiler/, install
    python files to ~/dotfiles/dotfiler/ and create dotfiler.ini
    """
    thisdir = path.dirname(path.realpath(__file__))

    if not path.isdir(DIRPATH):
        mkdir(DIRPATH)
    if not path.isdir(APPDIR):
        mkdir(APPDIR)

    create_config()
    for f in listdir(thisdir):
        if not path.isdir(f):
            copyfile(f, path.join(APPDIR, f))


if __name__ == "__main__":
    install()
