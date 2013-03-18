#!/bin/bash

SCRIPT_NAME=${BASH_SOURCE[0]}
BASH_ENV_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && cd ../  && pwd )"
DATE=$(date -d "today" +"%Y%m%d%H%M")

echo -e "#"
echo -e "# $SCRIPT_NAME: update scripts"
echo -e "#"
cd $BASH_ENV_DIR
git submodule init
git submodule update

echo -e "#"
echo -e "# $SCRIPT_NAME: install necessary packages"
echo -e "#"
source $BASH_ENV_DIR/scripts/get_platform.sh
if [ "$OS" == "debian" ]; then
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get install -y screen ack-grep
    $BASH_ENV_DIR/scripts/build_clang.sh
    $BASH_ENV_DIR/vimrc/build_vim_ubuntu.sh
elif [ "$OS" == "redhat" ]; then
    sudo yum install gcc python-devel
    sudo yum install screen
    sudo yum install ctags
    sudo yum install ack
    sudo yum install python-pip
    sudo pip install flake8
elif [ "$OS" == "mac" ]; then
    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
    brew update
    brew install python
    brew install macvim --override-system-vim
    mkdir ~/Applications/ &> /dev/null
    brew linkapps
fi

echo -e "#"
echo -e "# $SCRIPT_NAME: set bashrc, screenrc"
echo -e "#"
cd ~
mv .bashrc .bashrc.bak.$DATE &> /dev/null
ln -s $BASH_ENV_DIR/.bashrc
mv .screenrc .screenrc.bak.$DATE &> /dev/null
ln -s $BASH_ENV_DIR/.screenrc
mv scripts scripts.bak.$DATE &> /dev/null
ln -s $BASH_ENV_DIR/scripts
source .bashrc

# profile for mac
source $BASH_ENV_DIR/scripts/get_platform.sh
if [ "$OS" == "mac" ]; then
    echo -e "#"
    echo -e "# $SCRIPT_NAME: set profile"
    echo -e "#"
    cd ~
    mv .profile .profile.bak.$DATE &> /dev/null
    ln -s $BASH_ENV_DIR/.profile
    source .profile
fi

echo -e "#"
echo -e "# $SCRIPT_NAME: set git configs"
echo -e "#"
$BASH_ENV_DIR/scripts/set_git.sh

echo -e "#"
echo -e "# $SCRIPT_NAME: done !"
echo -e "#"
