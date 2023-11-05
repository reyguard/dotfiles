function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish

umask 002
function zman() { PAGER="nvim -R +/^\s{7}$1" man zshall }
	# GIT status prompt-plugin
# ---------------------------------------------
source ${ZDOTDIR}/zsh-git-prompt/zshrc.sh
# ---------------------------------------------

	## Colors
# ---------------------------------------------
autoload -U colors; colors
setopt prompt_subst
# ---------------------------------------------

	## Auto cd 
# ---------------------------------------------
setopt  autocd autopushd pushdignoredups correct
# ---------------------------------------------

# ---------------------------------------------
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals.*' insert-sections true
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
#zstyle ":completion:*" matcher-list 'm:{A-Zöäüa-zÖÄÜ}={a-zÖÄÜA-Zöäü}'
zstyle ':completion:*' max-errors 5
zstyle ':completion:*' menu select=0
zstyle ':completion:*:man:*' menu yes select
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' use-perl true
zstyle :compinstall filename '$HOME/.config/zsh/zshrc'
	_comp_options+=(globdots)	# Include hidden files.

# ---------------------------------------------
# Ctrl-w - delete a full WORD (including colon, dot, comma, quotes...)
my-backward-kill-word () {
# Add colon, comma, single/double quotes to word chars
   local WORDCHARS=''
   zle -f kill # Append to the kill ring on subsequent kills.
   zle backward-kill-word
}
zle -N my-backward-kill-word
bindkey '^w' my-backward-kill-word

# End of lines added by compinstall
# ---------------------------------------------

	## [Shift-Tab] - move through the completion menu backwards 
if [[ "${terminfo[kcbt]}" != "" ]]; then
	bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi 
# ---------------------------------------------


# Ignore useless files, like .pyc.
# ---------------------------------------------
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/).pyc'
# ---------------------------------------------

# Completing process IDs with menu selection.
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
# ---------------------------------------------

	## Load Modules
# ---------------------------------------------
autoload -Uz compinit
compinit -u
zmodload -i zsh/complist
# ---------------------------------------------


	## Vi-mode
# ---------------------------------------------
bindkey -v
export KEYTIMEOUT=15 # yes.. for following keybinds to work
# ---------------------------------------------
	## Normal/Escape-mode
# ---------------------------------------------
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode
# ---------------------------------------------

	## Edit line in vim with ctrl-e:
# ---------------------------------------------
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
# ---------------------------------------------

	## Bash-like backwards historysearch
# ---------------------------------------------
bindkey "^r" history-incremental-search-backward
# ---------------------------------------------

	## PROMPT
# ---------------------------------------------
terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
function zle-line-init zle-keymap-select {
# would want date above PS1
local usr="%{$fg[white]%}%n%{$fg[green]%}@%{$fg[white]%}%M%{$reset_color%}"

    PS1_2="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
	PS1="%{$terminfo_down_sc$PS1_2$terminfo[rc]%}$usr in %~ on $(git_super_status) %# "
    zle reset-prompt
}
preexec () { print -rn -- $terminfo[el]; }
zle -N zle-line-init
zle -N zle-keymap-select

	## colored GCC warnings and errors
# ---------------------------------------------
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# ---------------------------------------------

	# Plugin - load syntax-highlighting last
# ---------------------------------------------
fpath=(/usr/share/zsh/plugins/zsh-completions/src $fpath)
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# ---------------------------------------------

