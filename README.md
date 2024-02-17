# My .dotfiles configurations

## Setup instructions

1. Install the requirements/dependencies

Here is the list of dependencies to install with your package manager:

- git
- zsh
- tmux
- stow
- zoxide

2. Then once done clone the repo on your home folder

```
cd ~
git clone --recurse-submodules https://github.com/Killarexe/.dotfiles.git
```

3. Once cloned use `stow` to link the .dotfiles...

```
cd .dotfiles
stow .
```
