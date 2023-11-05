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
alias t="tmux attach || tmux new"
alias g="git"
alias v='/usr/bin/nvim'
alias vi='/usr/bin/nvim'
alias vim='/usr/bin/nvim'
alias vimdiff='/usr/bin/nvim -d'
alias ex='nvim -c Explore'
alias cal='cal -m'
alias date='date +"%Y %a, %d %b, %H:%M"'
alias ls='exa --icons'
alias grep="grep --color=auto"
alias ..="cd ../"
alias ...="cd ../.."
alias ....="cd ../../.."
alias -g C='| wc -l'
alias -g G='| grep'
alias -g L='| less'
alias -g M='| more'
alias -g S='&> /dev/null'
alias shutdown='sudo shutdown now'
alias luamake=${HOME}/.config/nvim/lua-language-server/3rd/luamake/luamake
# Simple directory relocation
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# Source zsh dotfiles
function reload() {
	if [[ -d $ZDOTDIR ]]
	. $ZDOTDIR/zprofile
	. ${HOME}/.zshenv
	. $ZDOTDIR/zshrc
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
if [[ -e $HOME/.zcompdump ]]; then 
	mv $HOME/.zcompdump $HOME/.cache/history/zsh/ 2>/dev/null
fi

