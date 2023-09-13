#!/usr/bin/env bash
set -euxo pipefail
sudo apt install curl
curl https://sh.rustup.rs -sSf | sh
