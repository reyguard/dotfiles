export ZDOTDIR=${HOME:-~}/.config/dotfiles/zsh

test -f $ZDOTDIR/.zshrc && . $ZDOTDIR/.zshrc
test -f $ZDOTDIR/.zprofile && . $ZDOTDIR/.zprofile
if [[ -f $ZDOTDIR/.zshenv ]]; then
	test ! -f $HOME/.zshenv && ln -s $ZDOTDIR/.zshenv $HOME/
fi

export EDITOR="/usr/bin/nvim"
export BROWSER="/mnt/c/Program Files/Firefox Developer Edition/firefox.exe"
export PAGER="/usr/bin/less"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
test -f $HOME/.cargo/env && . $HOME/.cargo/env
