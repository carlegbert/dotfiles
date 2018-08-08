# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# history settings
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# git completion
source /usr/share/bash-completion/completions/git

# PS1 settings
PS1_PROMPT="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w"
PS1_SYMBOL="\[\033[01;30m\]\$\[\033[00m\] "

if [ -f ~/.scripts/git-prompt.sh ]; then
  source ~/.scripts/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWSTASHSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  GIT_PS1_SHOWCOLORHINTS=1
  GIT_PS1_SHOWUPSTREAM="verbose"
  GIT_PS1_DESCRIBE_STYLE="contains"
  PROMPT_COMMAND='__git_ps1 "$PS1_PROMPT\[\033[00m\]" "$PS1_SYMBOL"'
else
  PS1='"$PS1_PROMPT""$PS1_SYMBOL"'
fi

# Alias + script definitions
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bash_scripts ]; then
  . ~/.bash_scripts
fi

# editor settings
export VISUAL=vim
export EDITOR="$VISUAL"

# misc variables
export XDG_CONFIG_HOME="$HOME/.config"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
