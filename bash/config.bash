#!/usr/bin/env bash


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s cdspell

# colored grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;33'

# colored ls
export LSCOLORS='Gxfxcxdxdxegedabagacad'

# Load the theme
source "${DOTFILES}/bash/prompt.bash"

# append to bash_history if Terminal.app quits
shopt -s histappend

# history handling
#
# Erase duplicates
# Bash History
export HISTCONTROL="ignoredups"
export HISTCONTROL=erasedups

# resize history size
export HISTSIZE=5000

export AUTOFEATURE=true autotest

function rh {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

conditionally_prefix_path "${DOTFILES}/bin"
conditionally_prefix_path "${HOME}/bin"
conditionally_prefix_path "${HOME}/local/bin"
