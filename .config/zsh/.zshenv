#!/bin/sh

#---------------
# Alisases
#---------------

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias cat=bat
alias grep=rg

alias docker='sudo docker'

alias rshell='ssh hover@192.168.1.156'
alias vencord_setup='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias stjavahome='sudo update-alternatives --config java'

#-----------
# Exports
#-----------

export PATH=$PATH:$HOME/.local/bin

if [ -f "$HOME/.dotfiles_private/exports" ]; then
  . "$HOME/.dotfiles_private/exports"
fi

#-----------
# Functions
#-----------

function nwdir {
  mkdir -p $1
  cd $1
}

function exex {
  nohup $1 &
}

function mkdir_ver {
  mkdir -p $1
  cd $1
  mkdir android
  mkdir linux
  mkdir mac
  mkdir web
  mkdir windows
}

function create_music_video {
  ffmpeg -loop 1 -f image2 -i $1 -i $2 -vf crop=in_h:in_h,scale=1920x1080,fps=fps=30 -pix_fmt yuv420p -vcodec h264_nvenc -shortest $3
}
