# ~/.bash_profile: executed by bash(1) for login shells.

umask 002
#PS1='\[\e[1;32m\]\u [ \[\e[1;33m\]\h\[\e[1;32m\] ][ \[\e[1;33m\]\w\[\e[1;32m\] ]$ \[\e[0m\]'
source "$HOME/.alias"
export EDITOR=vi

# Load bashrc
source "$HOME/.bashrc"

# User specific environment and startup programs

#export PATH=$PATH:$HOME/bin:$HOME/usr/local/bin:


#export PERL5LIB=$HOME/lib/perl/site_perl:$HOME/lib/perl/site_perl/5.8.4/i686-linux:$HOME/lib/perl/5.8.4/i686-linux:$HOME/usr/local/lib/perl:$HOME/usr/local/lib/perl/5.8.4:$HOME/usr/local/lib/perl/5.8.4/auto:$HOME/usr/local:$HOME/usr/local/bin/perl:$HOME/usr/local/share/perl:

#export PERL5LIB=$HOME/lib/perl5/site_perl:$HOME/lib/perl5/5.8.6/i686-linux:$HOME/lib/perl:

export PERL5LIB=$HOME/lib/perl/site_perl:$HOME/lib/perl/site_perl/5.8.4/i686-linux:$HOME/lib/perl/5.8.4/i686-linux:$HOME/lib/perl:$HOME/lib/perl/5.8.4:$HOME/lib/perl/5.8.4/auto:$HOME/usr/local/bin/perl:$HOME/usr/local/share/perl:$HOME/share/perl/5.8.4:$HOME/vicxar.com/common/lib:$HOME/dev.vicxar.com/common/lib:

export GEM_PATH=''
export GEM_HOME=''
