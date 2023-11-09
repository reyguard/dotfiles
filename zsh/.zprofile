# Colored manpages
function man() {
    env \
        LESS_TERMCAP_md=$(tput bold; tput setaf 4) \
	LESS_TERMCAP_me=$(tput sgr0) \
	LESS_TERMCAP_mb=$(tput blink) \
	LESS_TERMCAP_us=$(tput setaf 2) \
	LESS_TERMCAP_ue=$(tput sgr0) \
	LESS_TERMCAP_so=$(tput smso) \
	LESS_TERMCAP_se=$(tput rmso) \
	PAGER="${commands[nvim -R]:-$PAGER}" \
    man "$@"
}


## Aliases
# Source zsh dotfiles
function reload() {
	if [[ -d $ZDOTDIR ]]
	. $ZDOTDIR/.zprofile
	. ${HOME}/.zshenv
	. $ZDOTDIR/.zshrc
}

function config() {
	if [[ -d $ZDOTDIR ]]
	nvim -p $ZDOTDIR/{.zshrc,.zprofile,.zshenv}
}

# move lesshst file to designated directory
if [[ -e $HOME/.lesshst ]]
then 
	mv $HOME/.lesshst $HOME/.cache/history/less/ 2>/dev/null
fi

# move zcompdump file to designated directory
if [[ -e $ZDOTDIR/.zcompdump ]]; then 
	mv $HOME/.zcompdump $HOME/.cache/history/zsh/ 2>/dev/null
fi
