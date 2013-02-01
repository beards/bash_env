#!/bin/bash


BASH_ENV_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && cd ../  && pwd )"

cd ~
mv .bashrc .bashrc.ori &> /dev/null
ln -s $BASH_ENV_DIR/.bashrc
ln -s $BASH_ENV_DIR/scripts
mv .screenrc .screenrc.ori &> /dev/null
ln -s $BASH_ENV_DIR/.screenrc

source $BASH_ENV_DIR/scripts/get_platform.sh
if [ "$OS" == "mac" ]; then
    mv .profile .profile.ori &> /dev/null
    ln -s $BASH_ENV_DIR/.profile
fi
