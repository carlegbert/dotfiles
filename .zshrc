# .zshrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# history settings
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
HISTSIZE=1000
SAVEHIST=2000
HISTFILE="$HOME/.zsh_history"

# enable completion
autoload -Uz compinit && compinit

# PS1 settings
PS1_PROMPT="%B%F{green}%n@%m%b%f:%F{blue}%~"
PS1_SYMBOL="%F{black}%#%f "

setopt PROMPT_SUBST

if [ -f ~/.scripts/git-prompt.sh ]; then
  source "$HOME/.scripts/git-prompt.sh"
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWSTASHSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWCOLORHINTS=1
  export GIT_PS1_SHOWUPSTREAM="verbose"
  export GIT_PS1_DESCRIBE_STYLE="contains"
  precmd() { __git_ps1 "$PS1_PROMPT%f" "$PS1_SYMBOL" }
else
  PROMPT="$PS1_PROMPT$PS1_SYMBOL"
fi

# keyboard bindings
bindkey "^[[1;5C" forward-word   # ctrl+right
bindkey "^[[1;5D" backward-word  # ctrl+left
bindkey "^[[H" beginning-of-line # home
bindkey "^[[F" end-of-line       # end

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f /usr/bin/direnv ] && eval "$(direnv hook zsh)"

source "$HOME/.shellrc"

command -v uv &>/dev/null && eval "$(uv generate-shell-completion zsh)"
