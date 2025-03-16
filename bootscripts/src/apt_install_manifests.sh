#!/usr/bin/env bash
set -Eexuo pipefail

function aptInstall() {
    echo "Installing applications with apt"
    if [ $# -eq 0 ]; then # Check if any arguments were provided
        echo "Error: No manifest paths provided."
        echo "Usage: $0 path/to/manifest1.ini path/to/manifest2.ini ..."
        exit 1
    fi
    for manifest in "$@"; do
        if [ ! -f "$manifest" ]; then
            echo "Error: Manifest file not found: $manifest"
            exit 1
        fi
    done
    sudo apt update && sudo apt upgrade
    xargs sudo apt install < <(cat "$@")
    echo "Installation complete!"
}

aptInstall "$@"
