#!/usr/bin/env bash
set -euxo pipefail
function installUbuntuSpecificPackages() {
        local scriptDir
        scriptDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
        /bin/bash "$scriptDir/ubuntu_install_deadsnames_ppa_and_python.sh"

}
installUbuntuSpecificPackages
