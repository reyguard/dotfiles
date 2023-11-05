export ZDOTDIR=${HOME:-~}/.config/dotfiles/zsh

test -f ~/.config/dotfiles/zsh/.zshrc && . $ZDOTDIR/.zshrc
test -f ~/.config/dotfiles/zsh/.zprofile && . $ZDOTDIR/.zprofile

export EDITOR="/usr/bin/nvim"
. $HOME/.cargo/env
