# dotfiles

[Bash](https://www.gnu.org/software/bash/), [Zsh](http://www.zsh.org), [Vim](http://www.vim.org), and [Git](http://git-scm.com) dotfiles.

![Vim screenshot](img/vim.png)

## Install

```bash
make [basics | shells | vim | git]
```
Once `make` has completed, please close your shell and open a new instance.

### Basics

- Installs Xcode Command Line Tools, [Homebrew](http://brew.sh), [Python](https://www.python.org) (including [pip](https://pip.pypa.io/)), and [Virtualenv](https://virtualenv.pypa.io)

### Shells

- Symlinks the following **(overwriting existing versions)**:

```
shells/:
  ackrc               => ~/.ackrc
  bash_profile        => ~/.bash_profile
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
  gvimrc              => ~/.gvimrc
```

- Installs latest [Vim](http://www.vim.org), [Vundle.vim](https://github.com/gmarik/Vundle.vim) plugin manager, all Vim plugins in `~/.vimrc`, [Exuberant Ctags](http://ctags.sourceforge.net), and [Meslo for Powerline](https://github.com/powerline/fonts/tree/master/Meslo) (a patched font for symbols on the statusline)

### Git

- Symlinks the following **(overwriting existing versions)**:

```
git/:
  gitconfig           => ~/.gitconfig
  gitignore_global    => ~/.gitignore_global
```

- Installs latest [Git](http://git-scm.com) and prompts you to complete `~/.gitconfig_user`

## Custom iTerm Preferences

Launch [iTerm](http://iterm2.com), check and set "Preferences > General > Load preferences from a custom folder or URL" to this repository.

## Autocomplete in Vim

```bash
make vimcompletion
```

- Installs [CMake](http://www.cmake.org) and [YouCompleteMe](http://valloric.github.io/YouCompleteMe/)

## Switch to Zsh

```bash
make zsh
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
