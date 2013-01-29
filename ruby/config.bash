# rbenv
export PATH="${HOME}/.rbenv/bin:${PATH}"
[[ `which rbenv` ]] && eval "$(rbenv init -)"

[[ -e ~/.rbenv/completions/rbenv.bash ]] && source ~/.rbenv/completions/rbenv.bash

# Bundler Commands
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias bl='bundle list'
alias bu='bundle update'
alias bp='bundle package'
alias bake='bundle exec rake'
alias bspec='bundle exec rspec'

# Rails Commands
alias r='rails'
alias rg='rails g'
alias rs='rails s'
alias rc='rails c'
alias rn='rails new'
alias rd='rails dbconsole'
alias rp='rails plugin'
alias ra='rails application'
alias rd='rails destroy'
alias dbm='rake db:migrate'

alias ss='script/server'
alias ts="thin start"     # thin server
alias sc='script/console'
alias restartapp='touch tmp/restart.txt'
alias restart='touch tmp/restart.txt'  # restart passenger
alias devlog='tail -f log/development.log'
alias taild='tail -f log/development.log' # tail dev log
