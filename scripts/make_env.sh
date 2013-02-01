#!/bin/bash

BASH_ENV_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && cd ../  && pwd )"

# bashrc
cd ~
mv .bashrc .bashrc.ori &> /dev/null
ln -s $BASH_ENV_DIR/.bashrc
ln -s $BASH_ENV_DIR/scripts

# profile for mac
source $BASH_ENV_DIR/scripts/get_platform.sh
if [ "$OS" == "mac" ]; then
    mv .profile .profile.ori &> /dev/null
    ln -s $BASH_ENV_DIR/.profile
fi

# screenrc
mv .screenrc .screenrc.ori &> /dev/null
ln -s $BASH_ENV_DIR/.screenrc

# vimrc
mv .vimrc .vimrc.ori &> /dev/null
ln -s $BASH_ENV_DIR/vimrc/ .vim
ln -s .vim/.vimrc
