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
HYPHEN_INSENSITIVE="true"
OSNAME=$(cat /etc/os-release | grep ^NAME= | cut -d "\"" -f 2)
ZSH_THEME="agnoster"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview \
'bat --color=always --style=header,grid --line-range :500 {}'"
export FZF_DEFAULT_COMMAND="fd --no-ignore"
export FZF_CTRL_T_COMMAND="fd --no-ignore"
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=5000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
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
#alias ls='ls --color=auto'
#alias ll='ls -lash --color=auto'
alias ls='lsd'
alias ll='lsd -lah'
alias pdflatex='pdflatex -synctex=15 -interaction=nonstopmode -file-line-error'
alias mpv='mpv --no-audio-display'
alias newsboat='/usr/bin/newsboat --config-file=$HOME/.config/newsboat/config \
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
alias fd='fd --no-ignore'
alias gpg='LANG=en gpg'
alias xopen='xdg-open'
alias bookm='nvim ~/org/bookmarks'
alias files='nvim ~/org/files'
alias d='~/.local/bin/today.sh'
alias wiki='nvim ~/notes/kiwi/index.md'
alias birthdays='bat ~/org/birthdays'
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# Custom functions
# -----------------------------------------------------------------------------
# Picks an entry from the bookmarks, invoking fzf
bkm() {
    grep -v '^#' ~/org/bookmarks | grep . | fzf --preview-window 'right:0%' | cut -d ' ' -f1 | wl-copy
}
# Picks an entry from todo.txt file, and edits from there
todo() {
    file=~/org/todo.txt
    query=$1
    result="$(grep -v '^#' $file | grep -v '^x' | fzf --preview-window 'right:0%' --query=$query)"
    if [ ! -z "$result" -a "$result" != " " ]; then
        nvim +/"$result" $file
    fi
}
# Usage: ytdl FORMAT TARGET
ytdl() {
    yt-dlp -ix --audio-quality 0 --audio-format $1 "$2"
}
# Creates a today-note in a predefined folder
daily_plan() {
    nvim ~/org/life/todo/$(date --iso-8601).md
}
# Sets zathura as default pdf viewer
use_zathura() {
    xdg-mime default org.pwmt.zathura.desktop application/pdf
}
# Sets evince as default pdf viewer
use_evince() {
    xdg-mime default org.gnome.Evince.desktop application/pdf
}
# Starts planner in a convenient way
organize() {
    nvim -S ~/org/org.vim
}
# Pulls all git repos located in the pwd, in parallel
git_pull_all() {
    ls | xargs -P10 -I{} git -C {} pull
}
# Unzips all files in pwd
unzip_all() {
    find . -name '*.zip' -exec sh -c 'unzip -d "${1%.*}" "$1"' _ {} \;
}
# Yanks file path
yyfp() {
    if [ "$1" = "" ]; then
        file="."
    else
        file="$1"
    fi
    echo "$(readlink --canonicalize $file)" | wl-copy
    file=""
}
# Adds file to files list
addfl() {
    if [ "$1" = "" ]; then
        file="."
    else
        file="$1"
    fi
    file="$(readlink --canonicalize $file)"
    ~/.local/bin/add-file.sh "$file"
    file=""
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
# Deprecated: Sets zsh prompt via powerline-go
# -----------------------------------------------------------------------------
# function powerline_precmd() {
#     PS1="$($GOPATH/bin/powerline-go -error $? -jobs ${${(%):%j}:-0} -theme default)"
#
#     # Uncomment the following line to automatically clear errors after showing
#     # them once. This not only clears the error for powerline-go, but also for
#     # everything else you run in that shell. Don't enable this if you're not
#     # sure this is what you want.
#
#     #set "?"
# }
#
# function install_powerline_precmd() {
#   for s in "${precmd_functions[@]}"; do
#     if [ "$s" = "powerline_precmd" ]; then
#       return
#     fi
#   done
#   precmd_functions+=(powerline_precmd)
# }
#
# if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
#     install_powerline_precmd
# fi
# -----------------------------------------------------------------------------
# custom prompt
# -----------------------------------------------------------------------------
PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local EXIT="$?"
    if [ $EXIT != 0 ]; then
        PROMPT="%F{red}%B%n%b%f@%F{blue}%B%m%b%f%F{yellow}(%B%~%b)%f %F{red}%B—>%b%f % "
        RPROMPT="[%F{red}%B$EXIT%b%f]"
    else
        PROMPT="%F{red}%B%n%b%f@%F{blue}%B%m%b%f%F{yellow}(%B%~%b)%f %F{green}%B—>%b%f % "
        RPROMPT=""
    fi
}

precmd() { eval "$PROMPT_COMMAND" }

PROMPT='%F{red}%B%n%b%f@%F{blue}%B%m%b%f%F{yellow}(%B%~%b)%f %F{green}%B—>%b%f % '
RPROMPT=""
# -----------------------------------------------------------------------------
# Tilix VTE fix
# -----------------------------------------------------------------------------
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
# -----------------------------------------------------------------------------
