#!/usr/bin/env bash
set -Eeuo pipefail
# Specifically for using docker snap package. https://forum.snapcraft.io/t/snap-declaration-request-for-docker-snap/394
# and
# https://askubuntu.com/questions/907110/docker-snap-cannot-connect-to-the-docker-daemon-is-the-docker-daemon-running-o
sudo groupadd -f --system docker
sudo usermod -aG docker $USER
newgrp docker
