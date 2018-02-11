# .bashrc

# for vim coloring to work properly
export CLICOLOR=1
export TERM='xterm-256color'
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM=xterm-256color
fi

# Powerline prompt
function _update_ps1() {
  PS1="$(~/powerline-shell.py --cwd-mode fancy --cwd-max-depth 4 --cwd-max-dir-size 10 $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# setup aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

export EDITOR="/usr/bin/vim"

