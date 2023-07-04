#!/usr/bin/env bash
set -Eeuo pipefail

function execute_file(){
	(cd ~/dotfiles/bootscripts/src/ && ./$1)
}

execute_file docker_group.sh
execute_file compilers.sh
execute_file apt_install.sh
execute_file bash_symlinks.sh

execute_file docker.sh
execute_file cargo_sprinkles.sh
execute_file js_dev_env.sh
execute_file language_servers_install.sh

