# dotfiles

This repo mainly has an entrypoint
[`./bootscripts/src/main.py`](./bootscripts/src/main.py) that idempotently
installs/updates a Debian Bookworm+, Ubuntu 24+, or Fedora 40+ machine to keep
it up to date as a reasonable setting to get stuff done. I have used this repo
in various forms when daily-driving each of those three kinds of systems. While
I currently daily-drive Fedora, there have been times (such as for work) where I
run something like Ubuntu and need to configure that environment to my liking.

## Usage

Invoke like `./bootscripts/src/main.py -p travel_laptop`, or with a different profile.

```text
$ ./bootscripts/src/main.py --help
usage: main.py [-h] -p {workstation,travel_laptop,wsl}

A script to bootstrap and idempotently update my 'real' computers running Linux
where I do real things. It supports OSs that I have daily driven recently and
ones that I really do daily drive, either personally, or for testing things for
work. These computers are characterized by "profiles" which describe
environments I use and which applications need to be installed. This will figure
out which of the 3 supported OSs are running. The supported OSs are Debian
Bookworm+, Ubuntu 24.04+, and Fedora 41+.

Profiles
--------
Workstation -- The full environment that I want, including all of the graphical
applications I use on my most powerful personal computer. It also includes
Steam, since I only game on my personal desktop/workstation

Travel Laptop -- The thin and light computer I take with me when I travel. This
doesn't need too many graphical applications, but should be prepared to write,
test, debug, etc. SMALL programs. No gaming on this machine.

WSL -- Windows Subsystem for Linux. All work -- no play. No graphical
applications. Only programming from neovim and tools for working with data.

options:
  -h, --help            show this help message and exit
  -p, --profile {workstation,travel_laptop,wsl}

```

## Main tasks

- Apt/dnf installing a bunch of developer tools including neovim, language
  servers, sdkman/jvm ecosystem, data processing tools, compiler toolchains,
  docker, and machine-maintenance/monitoring tools.
- Symlink various dotfiles/config files within the user's `$HOME` directory.

My setup mainly consists of my (neo)vim configs, i3wm setup, and a collections
of things to apt install to make my local env less terrible as quickly as
possible.

## Things I dislike

- I want a recent version of Neovim and currently I use snap/snapd for that.
  That is the last thing I am using Snap for.

## Unautomated
- I installed VSCode, Chrome, and (maybe a few others?) manually since I want a
  relatively recent version. Maybe try [flatpack next
  time?](https://flathub.org/apps/com.visualstudio.code)?
