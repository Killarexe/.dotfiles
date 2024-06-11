# Set Zinit home dir
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit if not present
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add snippets
zinit snippet OMZP::git
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load auto-completions
autoload -U compinit && compinit

zinit cdreplay -q

# Init Oh My Posh
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"

# Set keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History settings
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color -a $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color -a $realpath'

# Aliases
alias ls='ls -A --color'
alias ll='ls -alF'
alias l='ls -CF'

alias cat=bat
alias grep=rg

alias rshell='ssh hover@192.168.1.156'
alias vencord_setup='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'

#-----------
# Exports
#-----------

export PATH=$PATH:$HOME/.local/bin

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC

if [ -f "$HOME/.dotfiles_private/exports" ]; then
  . "$HOME/.dotfiles_private/exports"
fi

#-----------
# Functions
#-----------

function nwdir {
  mkdir -p $1
  cd $1
}

function exex {
  nohup $1 &
}

function aud2flac {
  ffmpeg -i $1 $2
}

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

source "$HOME/.cargo/env"

fastfetch
