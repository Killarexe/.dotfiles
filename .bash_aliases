# Bash aliases

alias vi=nvim
alias vim=nvim
alias cat=bat
alias grep=rg

alias addfiles='git add .'
alias commit='git commit -m'
alias push='git push'

alias docker='sudo docker'

alias rshell='ssh hover@192.168.1.156'

alias reload='clear && source ~/.bash_profile'

alias stjavahome='sudo update-alternatives --config java'

alias wine='WINEPREFIX=~/.wine64 wine'

# Bash functions

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
