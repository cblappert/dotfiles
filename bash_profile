# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.bash_env_setup ]; then
  . ~/.bash_env_setup
fi

# fzf completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#CHEF.NO.SOURCE
