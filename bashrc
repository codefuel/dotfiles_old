# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
#if [[ -n "$PS1" ]] ; then

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# We have color support; assume it's compliant with Ecma-48
# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
   color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='[VM] ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h.dev\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='[VM] ${debian_chroot:+($debian_chroot)}\u@\h.dev:\w\$ '
fi
unset color_prompt force_color_prompt

# colored branch notification in your prompt
export PS1='\u@\h \[\e[1;33m\]$(__git_ps1 "%s")\[\e[0m\] \[\e[0;32m\]\w $ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
  PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
  ;;
*)
;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
#  if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
#    eval "`dircolors -b`"
#    alias ls='ls --color=auto'
#  
#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
#  fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

#export EDITOR=vim
#PS1='\[\e[1;32m\]\u [ \[\e[1;33m\]\h\[\e[1;32m\] ][ \[\e[1;33m\]\w\[\e[1;32m\] ]$ \[\e[0m\]'

# Enable colors for ls, etc.
eval `dircolors -b ~/.dir_colors`

#export PERL5LIB=$HOME/lib/perl5/site_perl:$HOME/lib/perl5/site_perl/5.8.4/i686-linux:$HOME/lib/perl5/5.8.4/i686-linux:

#export PERL5LIB=$HOME/lib/perl/site_perl:$HOME/lib/perl/site_perl/5.8.4/i686-linux:$HOME/lib/perl/5.8.4/i686-linux:$HOME/lib/perl:$HOME/lib/perl/5.8.4:$HOME/lib/perl/5.8.4/auto:$HOME/usr/local/bin/perl:$HOME/usr/local/share/perl:$HOME/share/perl/5.8.4:

# export SRC_ROOT=/home/asargent/src

export PERL5LIB=$HOME/lib/perl/site_perl:$HOME/lib/perl/site_perl/5.8.4/i686-linux:$HOME/lib/perl/5.8.4/i686-linux:$HOME/lib/perl:$HOME/lib/perl/5.8.4:$HOME/lib/perl/5.8.4/auto:$HOME/usr/local/bin/perl:$HOME/usr/local/share/perl:$HOME/share/perl/5.8.4:$HOME/vicxar.com/common/lib:$HOME/dev.vicxar.com/common/lib:

# Rails Env
#Railties now deprecates:
#
#RAILS_ROOT in favor of Rails.root,
#RAILS_ENV in favor of Rails.env, and
#RAILS_DEFAULT_LOGGER in favor of Rails.logger.

# Custom env variable to get around shared host passenger setting on Dreamhost for ENV['RAILS_ENV']
#export RAILS_ENVIRONMENT='development'

# Ruby local gems
#export PATH="$HOME/.rvm/gems:$HOME/.gems/bin:$HOME/opt/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$HOME/local/bin:$PATH"
eval "$(rbenv init -)"
export PREFIX=$HOME/local
export TMPDIR=$HOME/tmp

# Path to local gems
#export PATH="$HOME/bin:$HOME/.gems/bin:$PATH"

# Restart aliases
alias restarttq='touch ~/dev.tq.vicxar.com/tq_web/tmp/restart.txt'
alias restartmusic='touch ~/dev.music.aaronsargent.com/music_web/tmp/restart.txt'

# For when running FastCGI
alias restartt='killall -USR1 dispatch.fcgi'

