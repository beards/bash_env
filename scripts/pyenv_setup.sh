#!/bin/sh

set -e

BASH_ENV_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && cd ../  && pwd )"

source $BASH_ENV_DIR/scripts/get_platform.sh

if [ $OS == "mac" ]; then
    brew update
    if [ `brew list | grep pyenv` ]; then
        brew upgrade --HEAD pyenv
    else
        brew install --HEAD pyenv
    fi
else
    cd $HOME
    if [ ! -e ".pyenv" ]; then
        git clone git://github.com/yyuu/pyenv.git .pyenv
    else
        cd .pyenv
        git pull --rebase
    fi
fi
