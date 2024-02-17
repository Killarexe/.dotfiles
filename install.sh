#!/bin/sh

case `uname` in
  Linux )
     LINUX=1
     which yum && { echo "CentOS"; return; }
     which zypper && { echo "openSUSE"; return; }
     which apt-get && { echo "Debian"; return; }
     which pacman && { echo "Arch"; return; }
     ;;
  Darwin )
     DARWIN=1
     ;;
  * )
     # Handle AmigaOS, CPM, and modified cable modems.
     ;;
esac

stow .
