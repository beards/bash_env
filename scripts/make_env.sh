#!/bin/bash


BASH_ENV_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && cd ../  && pwd )"

cd ~
mv .bashrc .bashrc.ori
ln -s $BASH_ENV_DIR/.bashrc
ln -s $BASH_ENV_DIR/scripts

source $BASH_ENV_DIR/scripts/get_platform.sh
if [ "$OS" == "mac" ]; then
    mv .profile .profile.ori
    ln -s $BASH_ENV_DIR/.profile
fi
