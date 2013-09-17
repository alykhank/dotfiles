#!/bin/bash

ln -s $(pwd)/bash_profile ~/.bash_profile
ln -s $(pwd)/inputrc ~/.inputrc
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/gvimrc ~/.gvimrc
ln -s $(pwd)/gitconfig ~/.gitconfig
ln -s $(pwd)/gitignore ~/.gitignore
ln -s $(pwd)/git-completion.bash ~/.git-completion.bash

mkdir -p ~/.vim/bundle/
ln -s $(pwd)/ftplugin/ ~/.vim/ftplugin
