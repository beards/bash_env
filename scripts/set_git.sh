#!/bin/bash

git config --global color.ui true

git config --global alias.st status
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.log1 'log --pretty=oneline'
git config --global alias.sub submodule

git config --global push.default current

git config --global core.editor vim
