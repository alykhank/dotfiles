HOMEBREW_INSTALL_SCRIPT := /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
VIM_PLUG_PATH := ~/.vim/autoload/plug.vim
VIM_PLUG_INSTALLATION := curl -fLo $(VIM_PLUG_PATH) --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RESET := \033[0m
RED := \033[0;31m
GREEN := \033[0;32m
BLUE := \033[0;34m

.PHONY: all basics shells vim vimplug vimdotfiles vimplugins vimcompletion git gitdotfiles gituser brewbundle osx linux uninstall

all: basics shells vim git

basics:
	# Install Xcode Command Line Tools if nonexistent
	@xcode-select --print-path >/dev/null 2>&1 || xcode-select --install
	# Install Homebrew if nonexistent
	@hash brew 2>/dev/null || $(HOMEBREW_INSTALL_SCRIPT)

shells: $(wildcard shells/*)
	@echo "Symlink $(GREEN)[$^]$(RESET) to $(GREEN)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), ln -nfs $(CURDIR)/shells/$(df) ~/.$(df);)

vim: basics vimplug vimdotfiles vimplugins
	@echo "Install prerequisites for $(BLUE)$@$(RESET) via Homebrew"
	@brew install ctags vim

vimplug:
	# Install vim-plug plugin manager if nonexistent
	@[[ -f $(VIM_PLUG_PATH) ]] || $(VIM_PLUG_INSTALLATION)

vimdotfiles: $(wildcard vim/*)
	@echo "Symlink $(GREEN)[$^]$(RESET) to $(GREEN)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), ln -nfs $(CURDIR)/vim/$(df) ~/.$(df);)

vimplugins: vimplug vimdotfiles
	# Install Vim plugins
	@vim +PlugInstall +qall

vimcompletion: vim
	@echo "Install prerequisites for $(BLUE)$@$(RESET) via Homebrew"
	@brew install cmake
	# Install YouCompleteMe with --clang-completer option
	@~/.vim/bundle/YouCompleteMe/install.py --clang-completer

git: basics gitdotfiles gituser
	@echo "Install prerequisites for $(BLUE)$@$(RESET) via Homebrew"
	@brew install git

gitdotfiles: $(wildcard git/*)
	@echo "Symlink $(GREEN)[$^]$(RESET) to $(GREEN)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), ln -nfs $(CURDIR)/git/$(df) ~/.$(df);)

gituser:
	# Set up user Git configuration
	@$(CURDIR)/script/gituser

brewbundle: basics
	# Install all Homebrew formulas and casks
	@brew bundle

osx:
	# Configure OS X
	@$(CURDIR)/script/defaults

linux: shells vimplug vimdotfiles vimplugins gitdotfiles gituser
	@echo "Set up minimal configuration for Linux environment"

uninstall: $(wildcard shells/*) $(wildcard vim/*) $(wildcard git/*)
	@echo "Unlink $(RED)[$^]$(RESET) from $(RED)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), rm -rf ~/.$(df))
