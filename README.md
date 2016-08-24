# dotfiles

[Bash](https://www.gnu.org/software/bash/), [Zsh](http://www.zsh.org), [Vim](http://www.vim.org), and [Git](http://git-scm.com) dotfiles.

![Vim screenshot](img/vim.png)

## Install

```bash
make [basics | shells | vim | git]
```
Once `make` has completed, please close your shell and open a new instance.

### Basics

- Installs Xcode Command Line Tools and [Homebrew](http://brew.sh)

### Shells

- Symlinks the following **(overwriting existing versions)**:

```
shells/:
  ackrc               => ~/.ackrc
  bash_profile        => ~/.bash_profile
  gemrc               => ~/.gemrc
  inputrc             => ~/.inputrc
  latexmkrc           => ~/.latexmkrc
  zshrc               => ~/.zshrc
```

- Feel free to add custom bash commands in `~/.bashrc`, it is sourced from `~/.bash_profile`
- Feel free to add custom zsh commands in `~/.localrc`, it is sourced from `~/.zshrc`

### Vim

- Symlinks the following **(overwriting existing versions)**:

```
vim/:
  vim/                => ~/.vim
  vimrc               => ~/.vimrc
```

- Installs latest [Vim](http://www.vim.org), [Vundle.vim](https://github.com/gmarik/Vundle.vim) plugin manager, all Vim plugins in `~/.vimrc`, and [Exuberant Ctags](http://ctags.sourceforge.net)

### Git

- Symlinks the following **(overwriting existing versions)**:

```
git/:
  gitconfig           => ~/.gitconfig
  gitignore_global    => ~/.gitignore_global
```

- Installs latest [Git](http://git-scm.com) and prompts you to complete `~/.gitconfig_user`

## Custom Terminal Profiles

```bash
open profiles/Solarized\ Dark.terminal
```

Next, either change the value of "Preferences > General > On startup, open:" to "New window with profile:" or set up your Terminal windows as you wish and select "Window > Save Windows as Group…" while ensuring that you check "Use window group when Terminal starts".

A light variant, Solarized Light, is also included. The underlying color themes for these profiles may be found at [osx-terminal.app-colors-solarized](https://github.com/tomislav/osx-terminal.app-colors-solarized).

## Autocomplete in Vim

```bash
make vimcompletion
```

- Installs [CMake](http://www.cmake.org) and [YouCompleteMe](http://valloric.github.io/YouCompleteMe/)

## Switch to Zsh

```bash
make zsh
```

## Install Homebrew Formulas

```bash
make brewbundle
```

## Configure OS X

```bash
make osx
```

## Uninstall

```bash
make uninstall
```

## Inspiration

Inspired by the dotfiles of:

- [Zameer Manji](https://github.com/zmanji/dotfiles)
- [Steve Losh](https://bitbucket.org/sjl/dotfiles/src)
- [Tim Pope](https://github.com/tpope/tpope)
- [Gary Bernhardt](https://github.com/garybernhardt/dotfiles)
- [Zach Holman](https://github.com/holman/dotfiles)
- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
- [Mislav Marohnić](https://github.com/mislav/vimfiles)
