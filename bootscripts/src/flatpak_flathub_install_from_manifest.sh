#!/usr/bin/env bash
set -Eeuo pipefail

function flatpakFlathubInstallFromManifest() {
        local -r filePath="$1"

    # Check if the file exists
    if [[ ! -f "$filePath" ]]; then
        echo "Error: File '$filePath' does not exist or is not a regular file." >&2
        return 1  # Exit with a nonzero status code
    fi
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        xargs -a "$1" flatpak install flathub
}

flatpakFlathubInstallFromManifest "$@"
