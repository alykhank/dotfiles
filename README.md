# dotfiles

Bash, vim, and git dotfiles.

## Installation

```bash
make all
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR EMAIL ADDRESS"
git config --global github.user "YOUR GITHUB USERNAME"
```

## Load Custom iTerm Preferences

Launch iTerm, check and set "Preferences > General > Load preferences from a custom folder or URL" to this repository.

## Install Vim Plugins

```bash
vim +PluginInstall +qall
```

### Install Vim Autocomplete

```bash
cd ~/.vim/bundle/YouCompleteMe/
./install.sh --clang-completer
```
