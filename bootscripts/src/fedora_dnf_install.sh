#!/usr/bin/env bash
set -Eeuo pipefail
function fedoraDnfInstall() {

        local -r scriptDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
        echo "Installing applications with dnf"
        sudo dnf upgrade
        xargs sudo dnf install -y < <(cat "$scriptDir/manifest.ini" "$scriptDir/fedora_manifest.ini")
        "$scriptDir/fedora_install_vscode.sh"
}
fedoraDnfInstall
