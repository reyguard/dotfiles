export ZDOTDIR=${HOME:-~}/.config/dotfiles/zsh

test -f $ZDOTDIR/.zshrc && . $ZDOTDIR/.zshrc
test -f $ZDOTDIR/.zprofile && . $ZDOTDIR/.zprofile
test ! -f $HOME/.zshenv && ln -s $ZDOTDIR/.zshenv $HOME/

export EDITOR="/usr/bin/nvim"
. $HOME/.cargo/env
