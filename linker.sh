#!/bin/bash

shopt -s dotglob

mklinks() {
    # iterate through all files in dir
    for f in $1/*; do
        # figure out location file should be linked to
        fileloc=$(echo $f | sed 's/dotfiles\///g')
        # if f is a dir (but not .git and is not empty)
        if [ -d $f ] && [ $f != "$HOME/dotfiles/.git" ] && [ "$(ls -A $f)" ]; then 
            # if $fileloc doesn't exist, create it
            if ! [ -e $fileloc ]; then
                echo "Creating directory $fileloc"
                mkdir $fileloc
            fi
            mklinks $f
        elif ! [ -d $f ] && [ $f != "$HOME/dotfiles/linker.sh" ]; then
            echo "$fileloc now points to $f"
            ln -sf $f $fileloc
        fi
    done
}

mklinks "$HOME/dotfiles"
