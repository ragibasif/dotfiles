# ~/.zshrc

################################################################################
#                                    START                                     #
################################################################################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Auto-start tmux if not running
if command -v tmux &>/dev/null && [[ -z "$TMUX" ]]; then
    tmux attach || tmux new
fi

# Auto-run fastfetch on start-up
# fastfetch: https://github.com/fastfetch-cli/fastfetch
if command -v fastfetch &>/dev/null; then
    fastfetch
fi

################################################################################
#                                   ALIASES                                    #
################################################################################

# Aliases
unalias -a

alias lint='golangci-lint run'

# zoxide: https://github.com/ajeetdsouza/zoxide
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init $(basename "$SHELL"))"
    alias cd='z'
fi

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

# ls
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
alias du='du -h -d 1'

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
alias yt-dlp-music='yt-dlp -P "~/Music" -x --audio-format mp3 --audio-quality 0 -o "%(uploader)s_%(playlist)s/%(title)s.%(ext)s" --embed-metadata --parse-metadata "%(title)s:%(meta_title)s" --parse-metadata "%(uploader)s:%(meta_artist)s" --parse-metadata "%(playlist)s:%(meta_album)s" --parse-metadata "%(playlist_index)s:%(meta_track)s" -i'
alias yt-dlp-video='yt-dlp -P "~/Videos" -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"'
alias valgrind='valgrind --tool=memcheck --leak-check=full --show-reachable=yes --error-exitcode=1'

# Package Management
## For brew (macOS)
alias brewup='brew update && brew upgrade && brew cleanup'

# Completion
LISTMAX=10000  # do not show warning if there is too much items in completion
setopt hash_cmds  # hash command locations
setopt list_packed

# main opts
setopt append_history inc_append_history share_history # better history
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
# stty stop undef # disable accidental ctrl s

# history opts
HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved

################################################################################
#                                  FUNCTIONS                                   #
################################################################################

# free command doesn't exist in MacOS :(
free_mac() {
    vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf("%-16s % 16.2f Mi\n", "$1:", $2 * $size / 1048576);'
}

# Restart the shell.
restart_shell() {
  exec -l $SHELL
}

################################################################################
#                                     ZSH                                      #
################################################################################

# load modules
# move annoying .zcompdump files into a better hidden directory
autoload -Uz compinit
compinit -d ~/.config/zsh/.zcompdump
zmodload zsh/complist
autoload -U colors && colors

# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# vi keybinds
plugins=(
    vi-mode
)

# zsh-autosuggest config
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

################################################################################
#                                   EXPORTS                                    #
################################################################################

export PS1="➜ "
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

export MANPAGER="less -R --use-color -Dd+r -Du+b"

export PATH="$HOME/bin:$PATH" # this allows me to run the bash scripts i wrote

################################################################################
#                                     XDG                                      #
################################################################################

# https://specifications.freedesktop.org/basedir-spec/latest/
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
export XDG_CONFIG_DIRS="/etc/xdg"

################################################################################
#                            PROGRAMMING LANGUAGES                             #
################################################################################

export GOROOT=
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

