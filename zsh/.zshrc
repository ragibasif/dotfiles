# ~/.zshrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export ZSH="$HOME/.oh-my-zsh"

# move annoying .zcompdump files into a better hidden directory
autoload -Uz compinit
compinit -d ~/.config/zsh/.zcompdump

ZSH_THEME="apple"

zstyle ':omz:update' mode auto      # update automatically without asking
export UPDATE_ZSH_DAYS=1
COMPLETION_WAITING_DOTS="true"

DISABLE_AUTO_TITLE="true"

plugins=(
    vi-mode
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# aliases
unalias -a

export GOROOT=
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
alias lint='golangci-lint run'

# Auto-start tmux if not running
if command -v tmux &>/dev/null && [[ -z "$TMUX" ]]; then
    tmux attach || tmux new
fi

# Prefer fastfetch if installed
if command -v fastfetch &>/dev/null; then
    fastfetch
# Fallback to neofetch
elif command -v neofetch &>/dev/null; then
    neofetch
# Minimal built-in display
else
    echo -e "\n\e[1m$(whoami)@$(hostname)\e[0m"
    echo -e "OS: $(uname -srm)"
    echo -e "Shell: $(basename "$SHELL") $(BASH_VERSION:-$ZSH_VERSION)"
    echo -e "Uptime: $(uptime -p 2>/dev/null || uptime | awk -F',' '(print $1)')\n"
fi

# zoxide: https://github.com/ajeetdsouza/zoxide
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init $(basename "$SHELL"))"
    alias cd='z'
fi

# Restart the shell.
restart-shell() {
  exec -l $SHELL
}

# aliases

# Get OS type (Linux, Darwin/macOS, etc.)
OS="$(uname -s)"

# Linux-specific aliases
if [ "$OS" = "Linux" ]; then
    alias ls='ls --color=auto'
fi

# macOS-specific aliases
if [ "$OS" = "Darwin" ]; then
    alias ls='ls -G'
fi

# lsd: https://github.com/lsd-rs/lsd
if command -v lsd &>/dev/null; then
    alias ls='lsd'
fi

# Listing
alias l='ls -l'
alias lla='ls -la'
alias ll='ls -lh'
alias la='ls -lAh'


# eza: https://github.com/eza-community/eza
if command -v eza &>/dev/null; then
    alias tree='eza -TR --classify=always --color=always --icons=always --absolute=off'
fi

# bat: https://github.com/sharkdp/bat
if command -v bat &>/dev/null; then
    alias cat='bat'
fi

# fzf: https://github.com/junegunn/fzf
if command -v fzf &>/dev/null; then
    source <(fzf --zsh)
    alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
fi

# fd: https://github.com/sharkdp/fd
if command -v fd &>/dev/null; then
    alias find='fd'
fi

# ripgrep: https://github.com/BurntSushi/ripgrep
if command -v rg &>/dev/null; then
    alias rg="rg --hidden --smart-case --glob='!.git/' --no-search-zip --trim --colors=line:fg:black --colors=line:style:bold --colors=path:fg:magenta --colors=match:style:nobold"
fi

# Disk space
alias df='df -h'
alias du='du -h'

# Editor
alias v="nvim"

# Open vim without loading the vimrc.
alias vimnilla='vi -u NONE'

# Open neovim without loading the init.lua.
alias nvimnilla='nvim -u NONE'

# Search
alias grep='grep --color=auto'

# Safety nets to prevent accidents
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'


# Tmux
alias ta='tmux attach'
alias tl='tmux list-sessions'
alias tn='tmux new-session -s'

# Extras
alias yt-dlp='yt-dlp -P "~/Music" -x --audio-format mp3 --audio-quality 0 -o "%(uploader)s_%(playlist)s/%(title)s.%(ext)s" --embed-metadata --parse-metadata "%(title)s:%(meta_title)s" --parse-metadata "%(uploader)s:%(meta_artist)s" --parse-metadata "%(playlist)s:%(meta_album)s" --parse-metadata "%(playlist_index)s:%(meta_track)s" -i'
alias valgrind='valgrind --tool=memcheck --leak-check=full --show-reachable=yes --error-exitcode=1'

# Package Management
## For brew (macOS)
alias brewup='brew update && brew upgrade && brew cleanup'

# Completion
LISTMAX=10000  # do not show warning if there is too much items in completion
setopt glob_dots  # include dotfiles into completion by default
setopt hash_cmds  # hash command locations
setopt list_packed


# zsh-autosuggest config
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PATH="$HOME/bin:$PATH" # this allows me to run the bash scripts i wrote

[ -f "/Users/ragibasif/.ghcup/env" ] && . "/Users/ragibasif/.ghcup/env" # ghcup-env


# free command doesn't exist in MacOS :(
free_mac() {
    vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf("%-16s % 16.2f Mi\n", "$1:", $2 * $size / 1048576);'
}

