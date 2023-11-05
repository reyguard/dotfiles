
export ZDOTDIR=${HOME:-~}/.config/dotfiles/zsh
test -f ~/dotfiles/zsh/zshrc && . $ZDOTDIR/zshrc
test -f ~/dotfiles/zsh/zprofile && . $ZDOTDIR/zprofile
if [ ! -f ~/.zshenv ]
then
	ln -s $ZDOTDIR/.zshenv $HOME/
fi

export EDITOR="/usr/bin/nvim"
. $HOME/.cargo/env
