#!/usr/bin/env bash
set -Eeuo pipefail
npm i -g pyright dockerfile-language-server-nodejs sql-language-server \
        yaml-language-server vscode-langservers-extracted vim-language-server vscode-html-languageserver-bin typescript-language-server

rustup component add rust-src rust-analyzer
function installJavaLanguageServer(){
        # Eclipse java language server
        # The is not currently in my OS packages, so download a stable release manually until I find a better solution
        # for groking my way around Java with neovim. Or decide to swallow my pride and just use Intellij

        local tarname="jdt-language-server-1.9.0-202203031534.tar.gz"
        local outpath="/tmp/$tarname"
        curl -Lo "$outpath" "https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.9.0/$tarname"
        mkdir -p ~/.local/share/jdtls/ ~/bin
        tar -C ~/.local/share/jdtls/ -xzf $outpath
        ln -sf ~/.local/share/jdtls/bin/jdtls ~/bin/jdtls
        rm -rf $outpath
}
function installJdtlsIfNotExists() {
        if [ -x "$(command -v cargo)" ]; then
            echo "jdtls is already installed. skipping installation"
        else
            echo "jdtls not found. installing"
            installJavaLanguageServer
        fi
}
installJdtlsIfNotExists

