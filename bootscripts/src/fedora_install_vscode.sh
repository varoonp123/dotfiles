#!/usr/bin/env bash
set -Eeuxo pipefail

function install_microsoft_vscode_rpm_repo {
        # https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions
        sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
        echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

}
function install_vscode {
        dnf check-update
        sudo dnf install code
}
function installExtensions {

        local -r scriptDir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
        xargs -a "$scriptDir/vscode_extensions_manifest.ini" -n1 code  --force --install-extension

}
install_microsoft_vscode_rpm_repo
install_vscode
installExtensions
