# dotfiles

Bash, vim, and git dotfiles.

## Installation

```bash
make
```

- **WARNING**: The following files/folders will be symlinked into your home directory **(replacing any existing versions)**:
```
.bash_profile
.inputrc
.ackrc
.vim/
.vimrc
.gvimrc
.gitconfig
.gitignore_global
.git-completion.bash
.svn-completion.bash
```

- Git submodules will be initialized and updated (currently only Vim plugin manager, Vundle)

- All Vim plugins in `.vimrc` will be installed

- `Meslo LG S Regular for Powerline.otf` (a patched font for symbols on the Vim statusline) will be installed

- You will be prompted to complete the `.gitconfig`

## Load Custom [iTerm](http://iterm2.com) Preferences

Launch [iTerm](http://iterm2.com), check and set "Preferences > General > Load preferences from a custom folder or URL" to this repository.

## Install Vim Autocomplete ([YouCompleteMe](http://valloric.github.io/YouCompleteMe/))

```bash
make vimcompletion
```
