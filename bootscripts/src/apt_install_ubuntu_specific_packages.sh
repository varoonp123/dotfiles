#!/usr/bin/env bash
set -euxo pipefail

echo "Installing intellij community IDE and Python for ubuntu"
(cd ~/dotfiles/bootscripts/src/ && xargs -L1 -a $(realpath ubuntu_ppa_manifest.ini) sudo add-apt-repository)
sudo apt update && sudo apt upgrade
(cd ~/dotfiles/bootscripts/src/ && xargs -a $(realpath deadsnakes_ppa_install_manifest.ini) sudo apt install)
sudo apt install -y intellij-idea-community
