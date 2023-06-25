#!/usr/bin/env bash
set -Eeuo pipefail
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
mkdir -p ~/.config/nvim/
ln -sf ~/dotfiles/nvim_config/init.vim ~/.config/nvim/init.vim

