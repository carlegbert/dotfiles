# cat this file
alias aliases='cat ~/.bash_aliases'

# xclip aliases
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# command line cheatsheet
alias cheat='python3 ~/.cheat.d/cheat/cheat.py'

# docker aliases
alias dcstart='sudo docker-compose up'
alias dcstop='sudo docker-compose stop'
alias dcclean='sudo docker-compose rm -f' 
alias dcprocs='sudo docker-compose ps'
alias dcdone='sudo docker-compose stop && sudo docker-compose rm -f && sudo docker-compose ps'
