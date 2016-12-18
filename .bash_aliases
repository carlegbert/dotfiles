# cat this file
alias aliases='cat ~/.bash_aliases'

# laziness aliases
alias ..='_..' # see bash_scripts
alias ...='cd ../..'
alias ....='cd ../../..'
alias dev='cd ~/dev'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias autoremove='sudo apt-get autoremove'

# xclip aliases
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# dotfiler alias
alias dotfiler='python ~/dotfiles/dotfiler/dotfiler.py'
