#!/bin/bash

lowercase() {
    echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

OS=`lowercase \`uname\``
if [ "$OS" == "windowsnt" ]; then
    OS=windows
elif [ "$OS" == "darwin" ]; then
    OS=mac
fi

export $OS

