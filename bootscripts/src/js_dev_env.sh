#!/usr/bin/env bash
set -Eeuo pipefail
curl -fsSL https://bun.sh/install | bash
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
nvm install 18
nvm use 18
