# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Add in snippets
zinit snippet OMZP::git

# Load completions
autoload -U compinit && compinit
zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
# Open vim when pressing `v` in normal mode (Press Ctrl-X, Ctrl-V to temporarily enter vi's normal mode)
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

# Set other options
setopt interactivecomments      # Allow comments after commands
setopt autocd                   # cd to directories without typing cd
setopt extendedglob             # Expand file expression (e.g. **/file)

export CLICOLOR=1 # Enable color in some commands (e.g. ls)
export EDITOR=nvim

# Configure tools
source <(fzf --zsh)
source "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)

# Other PATH configurations
cdpath=(~ ~/Code) # Add ~ and ~/Code to cdpath
eval "$(zoxide init zsh)"

# Configure direnv
eval "$(direnv hook zsh)"

# Configure node bins
PATH=".git/safe/../../node_modules/.bin:$PATH"

#Add aider
export PATH="/Users/ashleyboehs/Library/Python/3.9/bin:$PATH"

# Aliases
alias vi=nvim
alias ls=lsd
alias cd=z
alias gs="git status"
alias glr="git pull --rebase"
alias gap="git add -p"
alias gpu="git push -u"
alias rr='cd $(git rev-parse --show-toplevel)'
