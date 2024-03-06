#!/usr/bin/env bash
set -Eeuo pipefail
echo "Installing applications. dnf+flatpak"
sudo dnf upgrade
(cd ~/dotfiles/bootscripts/src/ && xargs sudo dnf install -y < <(cat "$(realpath manifest.ini)" "$(realpath fedora_manifest.ini)"))

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
(cd ~/dotfiles/bootscripts/src/ && xargs -a "$(realpath flatpak_manifest.ini)" flatpak install flathub)
