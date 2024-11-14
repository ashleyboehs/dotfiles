# Pure Shell
fpath+=("$(brew --prefix)/share/zsh/site-functions")

autoload -U promptinit; promptinit
prompt pure

zstyle ':prompt:pure:prompt:success' color green

# Aliases

alias gs="git status"
alias vi="nvim"

