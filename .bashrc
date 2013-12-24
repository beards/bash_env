# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
elif [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# disable ctrl-s
stty -ixon

# prompt

PS1='${debian_chroot:+($debian_chroot)}\[\033[;33m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"

[ "$TERM" = "xterm" ] && TERM="xterm-256color"

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

# autoenv
. ~/scripts/autoenv/activate.sh

# local & encoding
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# User specific aliases and functions
alias ls='ls --color'
alias ll='ls -al --color'
alias grep='grep --color=always'
alias less='less -R'
alias vi='vim'
alias sc='screen'
alias sv='screen vim'
alias cdc='cd ~/_code/'
alias cdgit='cd ~/github'
alias gs='git status'
alias ga='git add'
alias gd='git diff'

# alias ack-grep un ubuntu
source ~/scripts/get_platform.sh
if [ "$OS" == "debian" ]; then
    alias ack='ack-grep'
fi

# enable local rc
source ~/.bashrc.local &> /dev/null
