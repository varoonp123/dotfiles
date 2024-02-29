#!/usr/bin/env bash
set -euxo pipefail
curl https://sh.rustup.rs -sSf | sh

# Install recent version of golang
function installGolang(){
        local golangDlBinName=go1.21.3.linux-amd64.tar.gz

        curl -OL "https://go.dev/dl/$golangDlBinName"
        rm -rf ~/.local/go && tar -C ~/.local -xzf $golangDlBinName
        rm -rf $golangDlBinName
}
installGolang
