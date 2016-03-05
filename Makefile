HOMEBREW_INSTALL_SCRIPT := /usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
VUNDLE_URL := https://github.com/gmarik/Vundle.vim.git
VUNDLE_PATH := $(CURDIR)/vim/vim/bundle/Vundle.vim
RESET := \033[0m
RED := \033[0;31m
GREEN := \033[0;32m
BLUE := \033[0;34m

.PHONY: all basics shells zsh vim vimvundle vimdotfiles vimplugins vimcompletion git gitdotfiles gituser brewbundle osx uninstall

all: basics shells vim git

basics:
	# Install Xcode Command Line Tools if nonexistent
	@xcode-select --print-path >/dev/null 2>&1 || xcode-select --install
	# Install Homebrew if nonexistent
	@hash brew 2>/dev/null || $(HOMEBREW_INSTALL_SCRIPT)

shells: $(wildcard shells/*)
	@echo "Symlink $(GREEN)[$^]$(RESET) to $(GREEN)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), ln -hfs $(CURDIR)/shells/$(df) ~/.$(df);)

zsh:
	@echo "Change default shell to $(BLUE)$@$(RESET)"
	@chsh -s /bin/zsh

vim: basics vimvundle vimdotfiles vimplugins
	@echo "Install prerequisites for $(BLUE)$@$(RESET) via Homebrew"
	@brew install ctags vim
	@brew cask install caskroom/fonts/font-dejavu-sans-mono-for-powerline

vimvundle:
	# Install Vundle.vim plugin manager if nonexistent
	@[[ -d $(VUNDLE_PATH) ]] || git clone $(VUNDLE_URL) $(VUNDLE_PATH)

vimdotfiles: $(wildcard vim/*)
	@echo "Symlink $(GREEN)[$^]$(RESET) to $(GREEN)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), ln -hfs $(CURDIR)/vim/$(df) ~/.$(df);)

vimplugins: vimvundle vimdotfiles
	# Install Vim plugins
	@vim +PluginInstall +qall

vimcompletion: vim
	@echo "Install prerequisites for $(BLUE)$@$(RESET) via Homebrew"
	@brew install cmake
	# Install YouCompleteMe with --clang-completer option
	@~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

git: basics gitdotfiles gituser
	@echo "Install prerequisites for $(BLUE)$@$(RESET) via Homebrew"
	@brew install git

gitdotfiles: $(wildcard git/*)
	@echo "Symlink $(GREEN)[$^]$(RESET) to $(GREEN)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), ln -hfs $(CURDIR)/git/$(df) ~/.$(df);)

gituser:
	# Set up user Git configuration
	@$(CURDIR)/script/gituser

brewbundle: basics
	# Install all Homebrew formulas and casks
	@brew bundle

osx:
	# Configure OS X
	@$(CURDIR)/script/defaults

uninstall: $(wildcard shells/*) $(wildcard vim/*) $(wildcard git/*)
	@echo "Unlink $(RED)[$^]$(RESET) from $(RED)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), rm -rf ~/.$(df))
