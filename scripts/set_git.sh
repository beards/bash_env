#!/bin/bash

git config --global color.ui true

git config --global alias.st status
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.log1 log --pretty=oneline

git config core.editor vim

#
# for git hub
#
. ./get_platform.sh

case $OS in
    "linux" )
        # Set git to use the credential memory cache that timeout after 1 hour (setting is in seconds)
        git config --global credential.helper 'cache --timeout=3600'
        ;;
    "mac" )
        curl -s -O http://github-media-downloads.s3.amazonaws.com/osx/git-credential-osxkeychain
        chmod +x git-credential-osxkeychain
        sudo mv git-credential-osxkeychain `dirname \`which git\``
        git config --global credential.helper osxkeychain
        ;;
esac

