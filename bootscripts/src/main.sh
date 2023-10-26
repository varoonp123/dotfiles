#!/usr/bin/env bash
set -Eeuxo pipefail

function execute_file(){
	(cd ~/dotfiles/bootscripts/src/ && source $1)
}


function printUbuntuOrDebianOSNameToStdout {
        # Writes either 'ubuntu', 'debian', or 'Unsupported' to stdout. This _should_ be rather infallible on all
        # unixy/posixy systems. Should basically never return a nonzero status code.
        if [ -f /etc/os-release ]; then
            source /etc/os-release
            if [[ "$ID" =~ ^debian.* ]]; then
                echo "debian"
            elif [[ "$ID" =~ ^ubuntu.* ]]; then
                echo "ubuntu"
            else
                echo "Unsupported"
            fi
        else
            echo "Unsupported"
        fi
}
function installOSSpecificPackages {
        local osname=$(printUbuntuOrDebianOSNameToStdout)
        echo "os name $osname"
        if [ "$osname" = "ubuntu" ]; then
                execute_file apt_install_ubuntu_specific_packages.sh
                execute_file ubuntu_docker_install_and_update.sh
        fi
        if [ "$osname" = "ubuntu" || "$osname" = "debian" ]; then
                execute_file apt_install.sh
                execute_file install_hugo.sh  # We should now have golang and can compile from source
        fi

        

}
# installOSSpecificPackages
# execute_file compilers.sh
# execute_file bash_symlinks.sh
set +u  # This script needs uses some odd bash
execute_file jvm_dev_env.sh
set -u

execute_file cargo_sprinkles.sh
execute_file js_dev_env.sh
execute_file language_servers_install.sh
