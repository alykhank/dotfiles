#!/bin/bash

ln -s $(pwd)/bash_profile ~/.bash_profile
ln -s $(pwd)/inputrc ~/.inputrc
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/gvimrc ~/.gvimrc
ln -s $(pwd)/gitconfig ~/.gitconfig
ln -s $(pwd)/gitignore ~/.gitignore
ln -s $(pwd)/git-completion.bash ~/.git-completion.bash

git submodule init
git submodule update
mkdir -p ~/.vim/bundle/
ln -s $(pwd)/vim-pathogen/autoload/ ~/.vim/autoload
ln -s $(pwd)/vim-colors-solarized/ ~/.vim/bundle/vim-colors-solarized
ln -s $(pwd)/vim-commentary/ ~/.vim/bundle/vim-commentary
ln -s $(pwd)/ftplugin/ ~/.vim/ftplugin
