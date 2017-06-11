# cat this file
alias aliases='cat ~/.bash_aliases'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# laziness aliases
alias ..='_..' # see ~/.bash_scripts
alias ...='cd ../..'
alias ....='cd ../../..'
alias dev='cd ~/dev'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade -y'
alias autoremove='sudo apt-get autoremove'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias mkdir='mkdir -pv'
alias ports='netstat -tuvanp'
alias cp='cp -iv'
alias e=$EDITOR

# xclip aliases
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# new wallpapers
alias randwall='bash $HOME/.scripts/randwall.sh'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

