#!/usr/bin/env bash
set -euxo pipefail
if [ -x "$(command -v cargo)" ]; then
    echo "cargo is already installed. Skipping installation"
else
    echo "Cargo not found. Installing"
    curl https://sh.rustup.rs -sSf | sh
fi

