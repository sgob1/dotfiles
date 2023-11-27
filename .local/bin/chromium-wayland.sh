#!/usr/bin/env bash

bwrap --dev-bind / / --tmpfs /home --bind /home/sirduke/.config/chromium /home/sirduke/.config/chromium --bind /home/sirduke/Scaricati /home/sirduke/Scaricati --unshare-all --share-net chromium-browser
