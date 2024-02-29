#!/usr/bin/env bash
set -Eeuo pipefail
echo "Installing applications. apt+snap+flatpak"
sudo dnf upgrade

(cd ~/dotfiles/bootscripts/src/ && xargs -a $(realpath manifest.ini) -a $(realpath fedora_manifest.ini) sudo dnf install -y)

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
(cd ~/dotfiles/bootscripts/src/ && xargs -a $(realpath flatpak_manifest.ini) flatpak install flathub)
