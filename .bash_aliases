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
alias upgrade='sudo apt-get upgrade'
alias autoremove='sudo apt-get autoremove'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias mkdir='mkdir -pv'
alias ports='netstat -tuvanp'
alias cp='cp -iv'
alias vim='nvim'

# xclip aliases
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# dotfiler alias
alias dotfiler='python ~/dotfiles/dotfiler/dotfiler.py'
