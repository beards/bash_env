#!/bin/bash

SCRIPT_NAME=${BASH_SOURCE[0]}

echo -e "########################################"
echo -e "# $SCRIPT_NAME: install necessary packages"
echo -e "########################################"
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
                     libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
                     libcairo2-dev libx11-dev libxpm-dev libxt-dev \
                     gcc python-dev ruby-dev mercurial

echo -e "########################################"
echo -e "# $SCRIPT_NAME: download vim source"
echo "########################################"
mkdir -p ~/packages
cd ~/packages/
hg clone https://code.google.com/p/vim/

echo -e "########################################"
echo -e "# $SCRIPT_NAME: build vim"
echo -e "########################################"
cd vim
./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-perlinterp \
            --enable-gui=gnome2 --enable-cscope
make all

echo -e "########################################"
echo -e "# $SCRIPT_NAME: make path link"
echo -e "########################################"
cd /usr/local/bin
sudo ln -s ~/packages/vim/src/vim
sudo ln -s vim vi
cd /usr/share/
sudo ln -s ~/packages/vim/runtime vim

echo -e "########################################"
echo -e "# $SCRIPT_NAME: done !"
echo -e "########################################"
