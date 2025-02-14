#!/usr/bin/env bash
set -euxo pipefail

function installUbuntuDeadsnakesPpaAndPythons() {
        echo "Installing deadsnakes PPA and Python packages"
        sudo add-apt-repository ppa:deadsnakes/ppa
        sudo apt update && sudo apt upgrade
        local scriptDir
        scriptDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
        xargs -a "$scriptDir/deadsnakes_ppa_install_manifest.ini" sudo apt install
}
installUbuntuDeadsnakesPpaAndPythons
