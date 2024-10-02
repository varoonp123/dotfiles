#!/usr/bin/env bash
set -Eeuo pipefail
npm i -g pyright dockerfile-language-server-nodejs sql-language-server \
        yaml-language-server vscode-langservers-extracted vim-language-server vscode-html-languageserver-bin typescript-language-server

rustup component add rust-src rust-analyzer
function installJavaLanguageServer(){
        # Eclipse java language server

        local tarname="jdt-language-server-1.9.0-202203031534.tar.gz"
        curl -OL "https://www.eclipse.org/downloads/download.php?file=/jdtls/milestones/1.9.0/$tarname"
        mkdir -p ~/.local/share/jdtls/
        tar -C ~/.local/share/jdtls/ -xzf $tarname
        ln -sf ~/.local/share/jdtls/bin/jdtls ~/.local/bin/jdtls
        rm -rf $tarname

}
installJavaLanguageServer

