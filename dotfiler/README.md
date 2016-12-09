# dotfiler
#### by Carl Egbert - egbertcarl@gmail.com

a python script for backing up your dotfiles so you can easily track them with source control or otherwise back them up. files will be backed up to ~/dotfiles.

### instructions for linux/osx
* clone the repo
* `$ python config.py` to set up the backup dir and config file
* optionally, open ~/dotfiles/`dotfiler.ini` with your favorite text editor and list the paths of the files you want to track under `[Files]` as key-value pairs, like so:
~~~
[Files]
.bashrc = /home/yourname/.bashrc
.bash_aliases = /home/yourname/.bash_aliases
~~~
* `$ python dotfiler.py get` to copy the stuff listed in `dotfiler.ini` to the backup folder
* `$ python dotfiler.py set` to overwrite dotfiles in your home dir with the ones from the backup dir
* `$ python dotfiler.py get/set [filepath 1] [filepath 2] [filepath n]` to get or set individual files. if you do this with a file not yet tracked in `dotfiler.ini` it will be added. when using 'set' in this manner, use the filename, rather than the full path (as per the key in dotfiler.ini).
* At the time being, if you 'get' an entire directory, all its contents, recursively, will be copied to the backup directory. However, only the directory path will be added to dotfiler.ini. when you `set`, all the contents of `dotfiles/foldername` will be copied.

[instructions for windows](https://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows)

### todo
* giant refactor because this has gotten ugly
* add option to confirm overwrite of files in home dir
* add option to not add files to dotfiler.ini automatically when targeted individually
* write install script
* add comments to dotfiler.ini upon creation
* add 'ignore' functionality for config
* other stuff probably
