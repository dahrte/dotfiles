##############################################################################
# VARIABLES / PATH (Nothing here should depend on plugins)
##############################################################################

export PATH="$HOME/.local/bin:$PATH"

# Homebrew (Linux)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

##############################################################################
# ZINIT (PLUGIN MANAGER) Must be initialized BEFORE plugins
##############################################################################

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")"
[ ! -d "$ZINIT_HOME/.git" ] && \
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "$ZINIT_HOME/zinit.zsh"

##############################################################################
# COMPLETION SYSTEM (CRITICAL) - compinit MUST come before fzf-tab
##############################################################################

autoload -U compinit
compinit

##############################################################################
# ZINIT PLUGINS - Order matters
##############################################################################

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting

##############################################################################
# KEYBINDINGS
##############################################################################

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

##############################################################################
# HISTORY
##############################################################################

HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE="$HOME/.zsh_history"

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks

##############################################################################
# COMPLETION STYLING (GENERIC)
#    Seguro agregar más zstyle aquí
##############################################################################

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no


##############################################################################
# FZF BASE (NO fzf-tab) This affects fzf CLI and bindings.
##############################################################################

# Theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

eval "$(fzf --zsh)"

##############################################################################
# FZF-TAB CONFIG (CRITICAL) - Everything related to fzf-tab goes here.
##############################################################################

# Visual flags
zstyle ':fzf-tab:*' fzf-flags \
  --ansi \
  --border=rounded \
  --height=80% \
  --layout=reverse \
  --info=inline \
  --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
  --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
  --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
  --color=selected-bg:#45475A,border:#6C7086,label:#CDD6F4

# GLOBAL Preview
# zstyle ':fzf-tab:complete:*' fzf-preview 'ls -a --color $realpath'
zstyle ':fzf-tab:complete:*' fzf-preview 'eza -la --color=always --icons --group-directories-first --no-git --no-permissions --no-filesize --no-user --no-time $realpath 2>/dev/null'

##############################################################################
# ZOXIDE - Important: Do not alias cd if you use fzf-tab.
##############################################################################

eval "$(zoxide init zsh)"

##############################################################################
# ALIASES
##############################################################################

# alias ls='ls -hal --color'
alias ls='eza -lagh --group-directories-first'
alias tree='eza --tree -L 2'
alias vim=nvim
alias c=clear
alias y=yazi

##############################################################################
# PROMPT - Always at the end
##############################################################################

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

##############################################################################
# FASTFETCH
##############################################################################

if [[ -o interactive ]]; then
  fastfetch
fi

##############################################################################
# EXTRA COMPLETIONS
##############################################################################

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
