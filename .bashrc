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
[ -f /usr/share/bash-completion/completions/git ] && source /usr/share/bash-completion/completions/git

# PS1 settings
PS1_PROMPT="\\[\\033[01;32m\\]\\u@\\h\\[\\033[00m\\]:\\[\\033[01;34m\\]\\w"
PS1_SYMBOL="\\[\\033[01;30m\\]\\$\\[\\033[00m\\] "

if [ -f ~/.scripts/git-prompt.sh ]; then
  source "$HOME/.scripts/git-prompt.sh"
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWSTASHSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWCOLORHINTS=1
  export GIT_PS1_SHOWUPSTREAM="verbose"
  export GIT_PS1_DESCRIBE_STYLE="contains"
  export PROMPT_COMMAND='__git_ps1 "$PS1_PROMPT\\[\\033[00m\\]" "$PS1_SYMBOL"'
else
  PS1='"$PS1_PROMPT""$PS1_SYMBOL"'
fi

# editor settings
export VISUAL=nvim
export EDITOR="$VISUAL"

# misc variables
export XDG_CONFIG_HOME="$HOME/.config"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f /usr/bin/direnv ] && eval "$(direnv hook bash)"

if type most &> /dev/null; then
  export MANPAGER="most"
fi


for f in "$HOME"/.bash/*; do
    source "$f"
done

[ -f "$HOME/.travis/travis.sh" ] && source "$HOME/.travis/travis.sh"

export PATH="$PATH:$HOME/.local/bin/"
