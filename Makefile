HOMEBREW_INSTALL_SCRIPT := ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
VUNDLE_URL := https://github.com/gmarik/Vundle.vim.git
VUNDLE_PATH := $(CURDIR)/vim/vim/bundle/Vundle.vim
RESET := \033[0m
RED := \033[0;31m
GREEN := \033[0;32m

.PHONY: all configure cider shells vim vimvundle vimdotfiles vimplugins vimcompletion git gitdotfiles gituser uninstall

all: configure shells vim git

configure:
	# Install Xcode Command Line Tools if nonexistent
	@xcode-select --print-path >/dev/null 2>&1 || xcode-select --install
	# Install Homebrew if nonexistent
	@hash brew 2>/dev/null || $(HOMEBREW_INSTALL_SCRIPT)
	# Install Python and Pip via Homebrew if nonexistent
	@hash pip 2>/dev/null || brew install python
	# Install Virtualenv if nonexistent
	@hash virtualenv 2>/dev/null || pip install virtualenv
	# Install Cider if nonexistent
	@hash cider 2>/dev/null || pip install cider
	@echo "Symlink $(GREEN)$(CURDIR)$(RESET) to $(GREEN)~/.cider$(RESET)"
	@ln -hfs $(CURDIR) ~/.cider
	# Install prerequisites for dotfiles via Cider
	@hash cider 2>/dev/null && cider install caskroom/cask/brew-cask cmake ctags git vim
	@hash cider 2>/dev/null && cider cask install caskroom/fonts/font-meslo-lg-for-powerline

cider:
	# Restore Cider configuration if Cider is available
	@hash cider 2>/dev/null && cider restore

shells: $(wildcard shells/*)
	@echo "Symlink $(GREEN)[$^]$(RESET) to $(GREEN)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), ln -hfs $(CURDIR)/shells/$(df) ~/.$(df);)

vim: vimvundle vimdotfiles vimplugins

vimvundle:
	# Install Vundle.vim plugin manager if nonexistent
	@[[ -d $(VUNDLE_PATH) ]] || git clone $(VUNDLE_URL) $(VUNDLE_PATH)

vimdotfiles: $(wildcard vim/*)
	@echo "Symlink $(GREEN)[$^]$(RESET) to $(GREEN)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), ln -hfs $(CURDIR)/vim/$(df) ~/.$(df);)

vimplugins: vimvundle vimdotfiles
	# Install Vim plugins
	@vim +PluginInstall +qall

vimcompletion: vimplugins
	# Install YouCompleteMe with --clang-completer option
	@~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

git: gitdotfiles gituser

gitdotfiles: $(wildcard git/*)
	@echo "Symlink $(GREEN)[$^]$(RESET) to $(GREEN)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), ln -hfs $(CURDIR)/git/$(df) ~/.$(df);)

gituser:
	# Set up user Git configuration
	@$(CURDIR)/script/gituser

uninstall: $(wildcard shells/*) $(wildcard vim/*) $(wildcard git/*)
	@echo "Unlink $(RED)[$^]$(RESET) from $(RED)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), rm -rf ~/.$(df))
