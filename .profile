source ~/.bashrc

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

alias ls='ls -vG'
alias ll='ls -vGal'
alias cdsim='cd ~/Library/Application\ Support/iPhone\ Simulator/'
alias vi='mvim'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
