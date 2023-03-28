#!/usr/bin/env bash

bwrap --dev-bind / / --tmpfs /home --bind /home/sirduke/.config/chromium /home/sirduke/.config/chromium --bind /home/sirduke/Downloads /home/sirduke/Downloads --unshare-all --share-net chromium-freeworld
