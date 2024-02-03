#Just start the basic files
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.bash_exports ]; then
  . ~/.bash_exports
fi

if [ -f $HOME/.cargo/env ]; then
  . "$HOME/.cargo/env"
fi

# Local executables exports
if [ -d "$HOME/Android/Sdk/platform-tools" ] ; then
    PATH="$HOME/Android/Sdk/platform-tools:$PATH"
fi

neofetch

##-----------------------------------------------------
## synth-shell-prompt.sh
if [ -f /home/killarexe/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
	source /home/killarexe/.config/synth-shell/synth-shell-prompt.sh
fi
