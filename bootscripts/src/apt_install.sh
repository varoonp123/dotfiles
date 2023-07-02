#!/usr/bin/env bash
set -Eeuo pipefail
echo "Installing applications. apt+snap+flatpak"
sudo add-apt-repository ppa:deadsnakes/ppa -y  # Python
sudo add-apt-repository ppa:aslatter/ppa -y  # alacritty
(cd ~/dotfiles/bootscripts/src/ && xargs -a $(realpath manifest.ini) sudo apt install)
sudo snap install --classic nvim  # Idk why nvim needs elevated permissions :(
# Trying some things in Snap. Experimental. Sandbox when we can. https://snapcraft.io/docs/snap-confinement
(cd ~/dotfiles/bootscripts/src/ && xargs -a $(realpath snap_manifest.ini) sudo snap install)
# Flatpak for unstable packages that I want to be 'bleeding edge.' I might regret this.
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
(cd ~/dotfiles/bootscripts/src/ && xargs -a $(realpath flatpak_manifest.ini) flatpak install flathub)
