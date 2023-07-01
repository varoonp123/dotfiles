#!/usr/bin/env bash
set -Eeuo pipefail
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
mkdir -p ~/.config/nvim/
ln -sf ~/dotfiles/nvim_config/vimrc.vim ~/.config/nvim/vimrc.vim
ln -sf ~/dotfiles/nvim_config/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/vscode/settings.json ~/.vscode/settings.json
