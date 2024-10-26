# dotfiles

This repo mainly has an entrypoint
[`./bootscripts/src/main.sh`](./bootscripts/src/main.sh) that idempotently
installs/updates a Debian Bookworm+, Ubuntu 24+, or Fedora 40+ machine to keep
it up to date as a reasonable setting to get stuff done. I have used this repo
in various forms when daily-driving each of those three kinds of systems. While
I currently daily-drive Fedora, there have been times (such as for work) where I
run something like Ubuntu and need to configure that environment to my liking.

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
