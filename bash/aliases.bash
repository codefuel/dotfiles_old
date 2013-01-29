alias reload!='. ~/.bashrc'

alias sl=ls
alias ls='ls -G'
alias la='ls -AF'
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'

alias _='sudo'

if [ $(uname) = "Linux" ]; then
  alias ls="ls --color=always"
fi

alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# Shell History
alias h='history'

alias md='mkdir -p'
alias rd='rmdir'
