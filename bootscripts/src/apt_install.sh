#!/usr/bin/env bash
set -Eeuo pipefail
echo "Installing applications. apt+snap+flatpak"
sudo add-apt-repository ppa:deadsnakes/ppa -y  # Python
sudo add-apt-repository ppa:mmk2410/intellij-idea -y # intellij IDE
sudo apt update

(cd ~/dotfiles/bootscripts/src/ && xargs -a $(realpath manifest.ini) sudo apt install)
(cd ~/dotfiles/bootscripts/src/ && xargs -I{} -a $(realpath snap_classic_install_manifest.ini) sudo snap install {} --classic)
# Trying some things in Snap. Experimental. Sandbox when we can. https://snapcraft.io/docs/snap-confinement
# -L1 because https://forum.snapcraft.io/t/trying-to-re-install-multiple-packages-with-snap-install-fails-with-install-refresh-information-results-from-the-store/24859
(cd ~/dotfiles/bootscripts/src/ && xargs -a $(realpath snap_manifest.ini) -L1 sudo snap install)
# Flatpak for unstable packages that I want to be 'bleeding edge.' I might regret this.
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
(cd ~/dotfiles/bootscripts/src/ && xargs -a $(realpath flatpak_manifest.ini) sudo flatpak install flathub)
