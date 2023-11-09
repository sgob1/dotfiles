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

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

alias mpv='mpv --no-audio-display'
alias newsboat='newsboat --config-file=$HOME/.config/newsboat/config \
	--url-file=$HOME/.config/newsboat/urls \
	--cache-file=$HOME/stuff/cache.db'
alias ranger='. ranger'
alias zathura='zathura --fork'
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
set -o vi
