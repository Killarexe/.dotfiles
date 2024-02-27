# My .dotfiles configurations

## Warning: This configuration is based on Arch Linux and KDE Plasma!

## Setup instructions

1. Then once done clone the repo on your home folder

```
cd ~
git clone --recurse-submodules https://github.com/Killarexe/.dotfiles.git
cd .dotfiles
```

2. Install the requirements/dependencies

Install Chaotic-AUR with those commands:

```
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
```

And add thoses lines at the end of the file `/etc/pacman.conf`:

```
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
```

To finish. Execute this command to install all requirements:
```
pacman -Syu - < pkglist.txt
```

3. Once cloned use `stow` to link the .dotfiles...

```
cd .dotfiles
stow .
```
