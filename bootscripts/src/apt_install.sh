#!/usr/bin/env bash
set -Eeuo pipefail
sudo add-apt-repository ppa:deadsnakes/ppa -y  # Python
sudo add-apt-repository ppa:aslatter/ppa -y  # alacritty
(cd ~/dotfiles/bootscripts/src/ && xargs -a $(realpath manifest.ini) sudo apt install)
# Snap for unstable packages that I want to be 'bleeding edge.' I might regret this.
(cd ~/dotfiles/bootscripts/src/ && xargs -a $(realpath snap_manifest.ini) sudo snap install --classic)
