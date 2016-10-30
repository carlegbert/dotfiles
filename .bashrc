# add this stuff to .bashrc

# replace PS1 stuff with this
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[0;32m\]\u\[\033[00m\]:\[\033[00;36m\]\w\[\033[1;36m\]\$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\w\$ '
fi

 link to .bash_scripts & .bash_aliases

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_scripts ]; then
    . ~/.bash_scripts
fi

# set vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

