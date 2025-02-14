#!/usr/bin/env python3
"""A script to bootstrap and idempotently update my 'real' computers running Linux where I do real things. It supports
OSs that I have daily driven recently and ones that I really do daily drive, either personally, or for testing things
for work. These computers are characterized by "profiles" which describe environments I use and which applications need
to be installed. This will figure out which of the 3 supported OSs are running. The supported OSs are Debian Bookworm+,
Ubuntu 24.04+, and Fedora 41+.

Profiles
--------
Workstation -- The full environment that I want, including all of the graphical applications I use on my most powerful
personal computer. It also includes Steam, since I only game on my personal desktop/workstation

Travel Laptop -- The thin and light computer I take with me when I travel. This doesn't need too many graphical
applications, but should be prepared to write, test, debug, etc. SMALL programs. No gaming on this machine.

WSL -- Windows Subsystem for Linux. All work -- no play. No graphical applications. Only programming from neovim and
tools for working with data.
"""

from argparse import ArgumentParser, Namespace, RawDescriptionHelpFormatter
from collections.abc import Sequence
import logging
import subprocess
from pathlib import Path
from enum import Enum, unique
from typing import Final

_LOGGER = logging.getLogger(__file__)


@unique
class _MachineProfile(str, Enum):
    workstation = "workstation"
    travel_laptop = "travel_laptop"
    wsl = "wsl"


@unique
class _SupportOperatingSystem(str, Enum):
    ubuntu = "ubuntu"
    debian = "debian"
    fedora = "fedora"


_SCRIPT_DIR: Final[Path] = Path(__file__).parent


def _execute_script_relative_to_scriptdir(file_name: str, args: Sequence[str] = ()):
    script_path = _SCRIPT_DIR.joinpath(file_name)
    subprocess.run([str(script_path.absolute()), *args], check=True)


def _get_os_name() -> _SupportOperatingSystem | None:
    os_release_path = Path("/etc/os-release")
    if not os_release_path.exists():
        return None
    with open(os_release_path, "r") as f:
        for line in f:
            if line.startswith("ID="):
                os_id = line.split("=")[1].strip().strip('"')
                if os_id.startswith("debian"):
                    return _SupportOperatingSystem.debian
                elif os_id.startswith("ubuntu"):
                    return _SupportOperatingSystem.ubuntu
                elif os_id.startswith("fedora"):
                    return _SupportOperatingSystem.fedora
                else:
                    return None
    return None


def _install_os_specific_packages():
    os_name = _get_os_name()
    if os_name == "ubuntu":
        _execute_script_relative_to_scriptdir("apt_install_ubuntu_specific_packages.sh")
        _execute_script_relative_to_scriptdir("ubuntu_docker_install_and_update.sh")
    if os_name in ("ubuntu", "debian"):
        _execute_script_relative_to_scriptdir("apt_install.sh")
    if os_name == "fedora":
        _execute_script_relative_to_scriptdir("fedora_dnf_install.sh")
    if os_name == "debian":
        _execute_script_relative_to_scriptdir("debian_docker_install_and_update.sh")


class _BootstrapOpts(Namespace):
    profile: _MachineProfile


def _get_parser() -> ArgumentParser:
    parser = ArgumentParser(
        description=__doc__, formatter_class=RawDescriptionHelpFormatter
    )
    parser.add_argument(
        "-p",
        "--profile",
        type=_MachineProfile,
        choices=tuple(map(str, _MachineProfile.__members__.keys())),
        required=True,
    )
    return parser


def main(args: Sequence[str] | None = None):
    parser = _get_parser()
    opts = parser.parse_args(args, _BootstrapOpts())
    logging.basicConfig(level=logging.INFO)
    _LOGGER.info("Running machine bootstrap with opts %s", opts)
    _run(opts)


def _run(opts: _BootstrapOpts):
    _execute_script_relative_to_scriptdir("compilers.sh")
    _install_os_specific_packages()
    _execute_script_relative_to_scriptdir("refresh_symlinks.sh")
    _execute_script_relative_to_scriptdir("jvm_dev_env.sh")
    _execute_script_relative_to_scriptdir("cargo_sprinkles.sh")
    _execute_script_relative_to_scriptdir("js_dev_env.sh")
    _execute_script_relative_to_scriptdir("language_servers_install.sh")
    if opts.profile == _MachineProfile.workstation:
        _execute_script_relative_to_scriptdir(
            "flatpak_flathub_install_from_manifest.sh",
            (
                str(
                    _SCRIPT_DIR.joinpath(
                        "flatpak_flathub_workstation_specific_manifest.ini"
                    )
                ),
            ),
        )
        pass
    elif opts.profile == _MachineProfile.travel_laptop:
        pass
    if opts.profile in (_MachineProfile.workstation, _MachineProfile.travel_laptop):
        _execute_script_relative_to_scriptdir(
            "flatpak_flathub_install_from_manifest.sh",
            (
                str(
                    _SCRIPT_DIR.joinpath(
                        "flatpak_flathub_relatively_light_graphical_apps_manifest.ini"
                    )
                ),
            ),
        )


if __name__ == "__main__":
    main()
