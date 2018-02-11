#!/bin/bash
alias npm='node -max_old_space_size=4096 /usr/local/bin/npm'
export PATH="/usr/local/sbin:/usr/local/Cellar/node/7.4.0/bin:$PATH:/opt/facebook/hg/bin/"

# setup thefuck
if [ "x${SSH_TTY}" = "x" ]; then
  eval "$(thefuck --alias f)"
  export PATH="$PATH:`yarn global bin`"
fi

# general unzipper utility
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# run prepack
prepack () {
  node --stack_size=10000 --stack_trace_limit=200 --max_old_space_size=8192 bin/prepack.js --compatibility jsc-600-1-4-17 --mathRandomSeed 0 --delayUnsupportedRequires "$@"
}

alias ls='ls -G'
alias grep='grep -n --color'
alias beep='echo -e "\a\a\a\a"'

# Vi bindings
set -o vi
HISTSIZE=130000 HISTFILESIZE=-1

# setup cd -- function
source ~/tools/acd_func.sh

alias javac7="/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home/bin/javac"
