#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# RubyGems
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
# Bundler
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

#Setting the GEM_PATH and GEM_HOME variables may not be necessary, check 'gem env' output to verify whether both variables already exist 
 GEM_HOME=$(ls -t -U | ruby -e 'puts Gem.user_dir')
  GEM_PATH=$GEM_HOME
   export PATH=$PATH:$GEM_HOME/bin

# Vi-like console
set -o vi

#
source /etc/profile.d/autojump.bash