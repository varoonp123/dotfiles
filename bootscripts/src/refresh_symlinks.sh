#!/usr/bin/env bash
set -Eeuo pipefail
function refreshSymlinks() {
        local -r scriptDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
        local -r repoDir="$(dirname "$(dirname "$scriptDir")")"
        ln -sf "$repoDir/bashrc" ~/.bashrc
        ln -sf "$repoDir/nvim_config/vimrc.vim" ~/.vimrc
        ln -sf "$repoDir/gitconfig" ~/.gitconfig
        mkdir -p ~/.config/nvim/
        ln -sf "$repoDir/nvim_config/vimrc.vim" ~/.config/nvim/vimrc.vim
        ln -sf "$repoDir/nvim_config/coc-settings.json" ~/.config/nvim/coc-settings.json
        ln -sf "$repoDir/nvim_config/init.lua" ~/.config/nvim/init.lua
        ln -sf "$repoDir/nvim_config/lua/" ~/.config/nvim/lua
        mkdir -p ~/.vscode/ ~/.config/Code/User/
        ln -sf "$repoDir/vscode/settings.json" ~/.config/Code/User/settings.json  # flatpak uses this path I think
        ln -sf "$repoDir/vscode/settings.json" ~/.vscode/settings.json  # While downloading from the website uses this path?
}
refreshSymlinks
