#!/bin/bash

BASH_ENV_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && cd ../  && pwd )"

# update scripts
cd $BASH_ENV_DIR
git submodule init
git submodule update

# bashrc
cd ~
mv .bashrc .bashrc.ori &> /dev/null
ln -s $BASH_ENV_DIR/.bashrc
ln -s $BASH_ENV_DIR/scripts
source .bashrc

# screenrc
cd ~
mv .screenrc .screenrc.ori &> /dev/null
ln -s $BASH_ENV_DIR/.screenrc

# profile for mac
cd ~
source $BASH_ENV_DIR/scripts/get_platform.sh
if [ "$OS" == "mac" ]; then
    mv .profile .profile.ori &> /dev/null
    ln -s $BASH_ENV_DIR/.profile
    source .profile
fi

# install homebrew on mac
if [ "$OS" == "mac" ]; then
    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
    brew update
fi

# update vim modules
cd $BASH_ENV_DIR/vimrc/
git submodule init
git submodule update

# vimrc
cd ~
mv .vimrc .vimrc.ori &> /dev/null
ln -s $BASH_ENV_DIR/vimrc/ .vim
ln -s .vim/.vimrc
ln -s .vim/.gvimrc

# git setting
$BASH_ENV_DIR/scripts/set_git.sh
