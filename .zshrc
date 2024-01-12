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
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/bin-scm:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export FZF_DEFAULT_OPTS="--ansi"
export FZF_DEFAULT_COMMAND="fd --no-ignore"
export SKIM_DEFAULT_COMMAND="fd --no-ignore --hidden"
export FZF_CTRL_T_COMMAND="fd --no-ignore"
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
bindkey -v

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/skim/shell/key-bindings.zsh

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
unalias ll
alias sk="sk --color=dark --ansi --preview='bat --color=always --style=header,grid --line-range :500 {}' --preview-window='right:38%'"
alias salto='cd "`sk --color=16 --ansi -c \"fd --type d --no-ignore . $HOME\"`"'
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
alias birthdays='bat ~/org/birthdays'
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# Custom functions
# -----------------------------------------------------------------------------
# filters todo.txt
tdsrch() {
    cat ~/org/todo.txt | rg -v "^x" | rg $@
}
# filters todo.txt, but ignore cases
tdisrch() {
    cat ~/org/todo.txt | rg -v "^x" | rg --ignore-case $@
}
# mkdir + cd
take() {
    mkdir -p "$1"
    cd "$1"
}
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# Implements OSC 7 for foot terminal
# -----------------------------------------------------------------------------
function osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}
# -----------------------------------------------------------------------------
# Called when executing a command; used in foot terminal
# -----------------------------------------------------------------------------
function preexec {
    #print -Pn "\e]0;${(q)1}\e\\"
    echo -en "\e]2;${@:3}\007\e]1;\007"
}

function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}
autoload -Uz add-zsh-hook
add-zsh-hook -Uz chpwd chpwd-osc7-pwd
#
# -----------------------------------------------------------------------------
# Sets zsh prompt via powerline-go
# -----------------------------------------------------------------------------
# function powerline_precmd() {
    # PS1="$($GOPATH/bin/powerline-go -error $? -jobs ${${(%):%j}:-0} -theme default)"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.

    #set "?"
# }

# function install_powerline_precmd() {
  # for s in "${precmd_functions[@]}"; do
    # if [ "$s" = "powerline_precmd" ]; then
      # return
    # fi
  # done
  # precmd_functions+=(powerline_precmd)
# }

# if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    # install_powerline_precmd
# fi
# -----------------------------------------------------------------------------
# custom prompt
# -----------------------------------------------------------------------------
#PROMPT_COMMAND=__prompt_command
#
# __prompt_command() {
#     local EXIT="$?"
#     if [ $EXIT != 0 ]; then
#         PROMPT="%F{red}%B%n%b%f@%F{blue}%B%m%b%f%F{yellow}(%B%~%b)%f %F{red}%B—>%b%f % "
#         RPROMPT="[%F{red}%B$EXIT%b%f]"
#     else
#         PROMPT="%F{red}%B%n%b%f@%F{blue}%B%m%b%f%F{yellow}(%B%~%b)%f %F{green}%B—>%b%f % "
#         RPROMPT=""
#     fi
# }
#
# precmd() { eval "$PROMPT_COMMAND" }
#
# PROMPT='%F{red}%B%n%b%f@%F{blue}%B%m%b%f%F{yellow}(%B%~%b)%f %F{green}%B—>%b%f % '
# RPROMPT=""
# -----------------------------------------------------------------------------
# Tilix VTE fix
# -----------------------------------------------------------------------------
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
# -----------------------------------------------------------------------------
# Starship prompt
# -----------------------------------------------------------------------------
# eval "$(~/.cargo/bin/starship init zsh)"
#
# -----------------------------------------------------------------------------
# Minimal prompt
# -----------------------------------------------------------------------------
source ~/.zsh-prompt/minimal.zsh
