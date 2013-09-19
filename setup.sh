#!/bin/bash

ln -s $(pwd)/bash_profile ~/.bash_profile
ln -s $(pwd)/inputrc ~/.inputrc
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/gvimrc ~/.gvimrc
ln -s $(pwd)/gitconfig ~/.gitconfig
ln -s $(pwd)/gitignore ~/.gitignore
ln -s $(pwd)/git-completion.bash ~/.git-completion.bash
ln -s $(pwd)/svn-completion.bash ~/.svn-completion.bash

git submodule init
git submodule update
mkdir -p ~/.vim/bundle/
ln -s $(pwd)/neobundle.vim/ ~/.vim/bundle/neobundle.vim
ln -s $(pwd)/ftplugin/ ~/.vim/ftplugin
# cd ~/.vim/bundle/YouCompleteMe
# ./install.sh --clang-completer
