#!/bin/sh
echo "Adding chaotic-aur..."

echo "\tAdding server keys..."
{
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
} &> /dev/null

echo "\tDownloading pkg list..."
{
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
} &> /dev/null

echo "\tEditing /etc/pacman.conf..."
STR='[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist'

if [[ -f /etc/pacman.conf ]]; then
  echo $STR >> /etc/pacman.conf
else
  echo "\t\tError: /etc/pacman.conf does not exist! Check if pacman is downloaded..."
  exit 1
fi

echo "Downloading pakages..."
sudo pacman -Syu - < pkglist.txt &> /dev/null
echo "Downloading AURs..."
yay -Syu - < aurlist.txt &> /dev/null
echo "Stow dotfiles..."
stow .

echo "Done!"
