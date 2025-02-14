#!/usr/bin/env bash
set -Eeuo pipefail
function aptInstall() {
        echo "Installing applications with apt"
        local -r scriptDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
        sudo apt update && sudo apt upgrade
        xargs sudo apt install < <(cat "$scriptDir/manifest.ini" "$scriptDir/apt_manifest.ini")
}
aptInstall
