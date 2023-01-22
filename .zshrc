# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
#           _
#   _______| |__  _ __ ___
#  |_  / __| '_ \| '__/ __|
# _ / /\__ \ | | | | | (__
#(_)___|___/_| |_|_|  \___|
#
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# .ZSHRC FILE
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# Variables setup and exporting
# -----------------------------------------------------------------------------
#ZSH_THEME="agnoster"
#export ZSH="$HOME/.oh-my-zsh"
HYPHEN_INSENSITIVE="true"
OSNAME=$(cat /etc/os-release | grep ^NAME= | cut -d "\"" -f 2)
ZSH_THEME="agnoster"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/bin-extra:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview \
'bat --color=always --style=header,grid --line-range :500 {}'"
export FZF_DEFAULT_COMMAND="fd --no-ignore"
export FZF_CTRL_T_COMMAND="fd --no-ignore"
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=5000
plugins=(git)
#source $ZSH/oh-my-zsh.sh
bindkey -v
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# OS-aware section
# -----------------------------------------------------------------------------
if [ "$OSNAME" = "Fedora Linux" ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/fzf/shell/key-bindings.zsh
    export LESS_TERMCAP_mb=$(
        tput bold
        tput setaf 2
    )
    export LESS_TERMCAP_md=$(
        tput bold
        tput setaf 6
    )
    export LESS_TERMCAP_me=$(tput sgr0)
    export LESS_TERMCAP_so=$(
        tput bold
        tput setaf 3
        tput setab 4
    )
    export LESS_TERMCAP_se=$(
        tput rmso
        tput sgr0
    )
    export LESS_TERMCAP_us=$(
        tput smul
        tput bold
        tput setaf 7
    )
    export LESS_TERMCAP_ue=$(
        tput rmul
        tput sgr0
    )
    export LESS_TERMCAP_mr=$(tput rev)
    export LESS_TERMCAP_mh=$(tput dim)
    export LESS_TERMCAP_ZN=$(tput ssubm)
    export LESS_TERMCAP_ZV=$(tput rsubm)
    export LESS_TERMCAP_ZO=$(tput ssupm)
    export LESS_TERMCAP_ZW=$(tput rsupm)
    export GROFF_NO_SGR=1
elif [ "$OSNAME" = "Arch Linux" ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
    bindkey -v
fi
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# Completion
# -----------------------------------------------------------------------------
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
setopt MENU_COMPLETE
setopt no_list_ambiguous
bindkey '^ ' autosuggest-accept
bindkey '^[[Z' reverse-menu-complete
zstyle ':completion:*' menu select
zstyle ':completion:*:*:git:*' script
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
autoload -U compinit
compinit
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias pdflatex='pdflatex -synctex=15 -interaction=nonstopmode -file-line-error'
alias mpv='mpv --no-audio-display'
alias newsboat='newsboat --config-file=$HOME/.config/newsboat/config \
	--url-file=$HOME/.config/newsboat/urls \
	--cache-file=$HOME/stuff/cache.db'
alias ranger='. ranger'
alias zathura='zathura --fork'
alias docker='podman'
alias mkdir='mkdir -v'
alias du='du -c -h'
alias ..='cd ..'
alias grep='grep --color=auto'
alias rg='rg --no-ignore'
alias gpg='LANG=en gpg'
alias xopen='xdg-open'
alias bkm='nvim ~/org/bookmarks'
alias d='nvim ~/org/diary'
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# Custom functions
# -----------------------------------------------------------------------------
# Usage: ytdl FORMAT TARGET
ytdl() {
    youtube-dl -ix --audio-quality 0 --audio-format $1 "$2"
}
# Creates a today-note in a predefined folder
dailyPlan() {
    nvim ~/org/life/todo/$(date --iso-8601).md
}
# Sets zathura as default pdf viewer
setZathura() {
    xdg-mime default org.pwmt.zathura.desktop application/pdf
}
# Sets evince as default pdf viewer
setEvince() {
    xdg-mime default org.gnome.Evince.desktop application/pdf
}
# Starts planner in a convenient way
organize() {
    nvim -S ~/org/org.vim
}
# Pulls all git repos located in the pwd, in parallel
gitPullAll() {
    ls | xargs -P10 -I{} git -C {} pull
}

syncMail () {
    mbsync marco-sgobino &
    mbsync units &
    mbsync sgob95 &
    mbsync uniud &
    mbsync infomaniak &
}
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# nnn cd on quit
# -----------------------------------------------------------------------------
if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# nnn plugins
# -----------------------------------------------------------------------------
export NNN_PLUG='f:finder;o:fzopen;d:diffs;v:imgview;'
export NNN_OPENER=$HOME/.config/nnn/plugins/nuke
_urlencode() {
    local length="${#1}"
    for ((i = 0; i < length; i++)); do
        local c="${1:$i:1}"
        case $c in
            %) printf '%%%02X' "'$c" ;;
            *) printf "%s" "$c" ;;
        esac
    done
}
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# Implements OSC 7 for foot terminal
# -----------------------------------------------------------------------------
osc7_cwd() {
    printf '\e]7;file://%s%s\e\\' "$HOSTNAME" "$(_urlencode "$PWD")"
}
# -----------------------------------------------------------------------------
autoload -Uz add-zsh-hook
add-zsh-hook -Uz chpwd osc7_cwd
#
# -----------------------------------------------------------------------------
# Launch the starship!
# -----------------------------------------------------------------------------
eval "$(starship init zsh)"
# -----------------------------------------------------------------------------
