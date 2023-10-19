#!/usr/bin/env bash
set -Eeuo pipefail
curl -fsSL https://bun.sh/install | bash
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
nvm install 18
nvm use 18
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
