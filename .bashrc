# -----------------------------------------------------------------------------
#    _               _
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|
#
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# .bashrc file
# -----------------------------------------------------------------------------
#
# -----------------------------------------------------------------------------
# FEDORA BASH INITIAL CONFIGURATION
# Do not delete or modify this section
# -----------------------------------------------------------------------------
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# ------------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Variables setup and exporting
# -----------------------------------------------------------------------------
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/bin-test:$PATH
export PATH=$HOME/.cargo/bin:$PATH
# ------------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------
alias ll='ls -la'
alias pdflatex='pdflatex -synctex=15 -interaction=nonstopmode -file-line-error'
alias mpv='mpv --no-audio-display'
alias newsboat='newsboat --config-file=$HOME/.config/newsboat/config \
	--url-file=$HOME/.config/newsboat/urls \
	--cache-file=$HOME/.stuff/cache.db'
alias ranger='. ranger'
alias zathura='zathura --fork'
alias vim='nvim'
alias tb='toolbox'
alias tbe='toolbox enter'
alias tbr='toolbox run'
alias sway='DESKTOP_SESSION=sway sway'
# ------------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Custom functions
# -----------------------------------------------------------------------------
wav2flacFolder() {
    for i in *.wav;
        do
            name="$(basename "${i/.wav}")";
            echo "Converting file $name...";
            ffmpeg -i "$name.wav" "$name.flac";
        done
}

flac2wavFolder() {
    for i in *.flac;
        do
            name="$(basename "${i/.flac}")";
            echo "Converting file $name...";
            ffmpeg -i "$name.flac" "$name.wav";
        done
}

flac2opusFolder() {
    for i in *.flac;
        do
            name="$(basename "${i/.flac}")";
            echo "Converting file $name...";
            ffmpeg -i "$name.flac" "$name.opus";
        done
}

opus2wavFolder() {
    for i in *.opus;
        do
            name="$(basename "${i/.opus}")";
            echo "Converting file $name...";
            ffmpeg -i "$name.opus" "$name.wav";
        done
}

mpthree2wavFolder() {
    for i in *.mp3;
        do
            name="$(basename "${i/.mp3}")";
            echo "Converting file $name...";
            ffmpeg -i "$name.mp3" "$name.wav";
        done
}

wavResamplerFolder() {
    for i in *.wav;
        do
            name="$(basename "${i/.wav}")";
            echo "Converting to 44100 Hz the file $name.wav...";
            ffmpeg -i "$name.wav" -ar 44100 "$name.44100.wav";
            mv "./$name.44100.wav" "./$name.wav";
        done
}
# ------------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Colored man pages
# -----------------------------------------------------------------------------
export LESS="--RAW-CONTROL-CHARS"
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1
# -----------------------------------------------------------------------------
# Enabling vi mode
# -----------------------------------------------------------------------------
set -o vi
