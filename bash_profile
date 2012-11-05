# ~/.bash_profile: executed by bash(1) for login shells.

umask 002
source "$HOME/.alias"
export EDITOR=vi

# Load bashrc
source "$HOME/.bashrc"

export PERL5LIB=$HOME/lib/perl/site_perl:$HOME/lib/perl/site_perl/5.8.4/i686-linux:$HOME/lib/perl/5.8.4/i686-linux:$HOME/lib/perl:$HOME/lib/perl/5.8.4:$HOME/lib/perl/5.8.4/auto:$HOME/usr/local/bin/perl:$HOME/usr/local/share/perl:$HOME/share/perl/5.8.4:$HOME/vicxar.com/common/lib:$HOME/dev.vicxar.com/common/lib:

export GEM_PATH='/home/vicxar_projects/.gems'
export GEM_HOME='/home/vicxar_projects/.gems'
