#!/bin/bash

git config --global color.ui true

git config --global alias.st status
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.log1 log --pretty=oneline

# for git hub
git_cmd_path=`which git`
git_cmd_dir=`dirname $git_cmd_path`
wget http://github-media-downloads.s3.amazonaws.com/osx/git-credential-osxkeychain
chmod u+x git-credential-osxkeychain
sudo mv git-credential-osxkeychain $git_cmd_dir
git config --global credential.helper osxkeychain

