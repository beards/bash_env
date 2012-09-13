# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias ll='ls -al --color'
alias vi='vim'
alias sc='screen'
alias sv='screen vim'
alias cdc='cd ~/_code/'
alias cdgit='cd ~/github'

case $TERM in
 xterm*|rxvt*)
  PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}[${PWD/$HOME/~}]\007"'
 ;;
 screen*)
  PROMPT_COMMAND='echo -ne "\033k[${USER}@`hostname -s` `basename ${PWD}`]\033\0134"'
 ;;
 *)
 ;;
esac

