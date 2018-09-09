# cat this file
alias aliases='cat ~/.bash_aliases'

# laziness aliases
alias ..='_..' # see ~/.bash_scripts
alias ...='_.. 2'
alias ....='_.. 3'
alias update='sudo apt-get update -y'
alias upgrade='sudo apt-get upgrade -y'
alias autoremove='sudo apt-get autoremove -y'
alias aptall='update && upgrade && autoremove'
alias die='shutdown now'
alias ls='ls --color=auto'
alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'
alias mkdir='mkdir -pv'
alias ports='netstat -tuvanp'
alias cp='cp -iv'
alias e='"$EDITOR"'
alias esudo='sudo -E "$EDITOR"'
alias mktempd='cd $(mktemp -d)'

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

# hack for virtualenv pip freeze bug
alias pipfreeze='pip freeze | grep -v "pkg-resources"'
