if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# laziness aliases
alias ..='_..' # see ~/.bash_scripts
alias ...='_.. 2'
alias ....='_.. 3'
alias die='shutdown now'
alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'
alias mkdir='mkdir -pv'
alias ports='netstat -tuvanp'
alias cp='cp -iv'
alias e='"$EDITOR"'
alias esudo='sudo -E "$EDITOR"'
alias tempdir='cd $(mktemp -d)'
alias doco="docker-compose"
alias ku="kubectl"

# xclip aliases
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# hack for virtualenv pip freeze bug
alias pipfreeze='pip freeze | grep -v "pkg-resources"'

# racket repl for SICP exercises
alias sicp='racket -i -p neil/sicp -l xrepl'
