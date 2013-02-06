#!/bin/bash

BASH_ENV_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && cd ../  && pwd )"

# update scripts
echo -e "# update scripts\n#"
cd $BASH_ENV_DIR
git submodule init
git submodule update

# bashrc
echo -e "# set bashrc\n#"
cd ~
mv .bashrc .bashrc.ori &> /dev/null
ln -s $BASH_ENV_DIR/.bashrc
ln -s $BASH_ENV_DIR/scripts
source .bashrc

# screenrc
echo -e "# set screenrc\n#"
cd ~
mv .screenrc .screenrc.ori &> /dev/null
ln -s $BASH_ENV_DIR/.screenrc

# profile for mac
cd ~
source $BASH_ENV_DIR/scripts/get_platform.sh
if [ "$OS" == "mac" ]; then
    echo -e "# set profile\n#"
    mv .profile .profile.ori &> /dev/null
    ln -s $BASH_ENV_DIR/.profile
    source .profile
fi

# install homebrew on mac
if [ "$OS" == "mac" ]; then
    echo -e "# install homebrew\n#"
    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
    brew update
fi

# install packages on linux
if [ "$OS" == "debian" ]; then
    echo -e "# install necessary packages\n#"
    sudo apt-get install gcc python-dev
    sudo apt-get install screen
    sudo apt-get install exuberant-ctags
    sudo apt-get install ack-grep
    sudo apt-get install python-pip
    sudo pip install flake8
    sudo apt-get install vim
elif [ "$OS" == "redhat" ]; then
    echo -e "# install necessary packages\n#"
    sudo yum install gcc python-devel
    sudo yum install screen
    sudo yum install ctags
    sudo yum install ack
    sudo yum install python-pip
    sudo pip install flake8
fi

# update vim modules
echo -e "# update vim modules\n#"
cd $BASH_ENV_DIR/vimrc/
git submodule init
git submodule update

# vimrc
echo -e "# set vimrc\n#"
cd ~
mv .vimrc .vimrc.ori &> /dev/null
ln -s $BASH_ENV_DIR/vimrc/ .vim
ln -s .vim/.vimrc
ln -s .vim/.gvimrc

# git setting
echo -e "# set git configs\n#"
$BASH_ENV_DIR/scripts/set_git.sh
