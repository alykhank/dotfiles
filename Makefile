HOMEBREW_INSTALL_SCRIPT := ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
RESET := \033[0m
RED := \033[0;31m
GREEN := \033[0;32m
BLUE := \033[0;34m
GITCONFIG_USER := ~/.gitconfig_user

.PHONY: all configure cider submodules shells vim vimdotfiles vimplugins vimcompletion git gitdotfiles gitconfiguration uninstall

all: configure submodules shells vim git

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

submodules:
	# Initialize and update Git submodules
	@git submodule update --init --recursive

shells: $(wildcard shells/*)
	@echo "Symlink $(GREEN)[$^]$(RESET) to $(GREEN)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), ln -hfs $(CURDIR)/shells/$(df) ~/.$(df);)

vim: vimdotfiles vimplugins

vimdotfiles: $(wildcard vim/*)
	@echo "Symlink $(GREEN)[$^]$(RESET) to $(GREEN)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), ln -hfs $(CURDIR)/vim/$(df) ~/.$(df);)

vimplugins: vimdotfiles
	# Install Vim plugins
	@vim +PluginInstall +qall

vimcompletion: vimplugins
	# Install YouCompleteMe with --clang-completer option
	@~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

git: gitdotfiles gitconfiguration

gitdotfiles: $(wildcard git/*)
	@echo "Symlink $(GREEN)[$^]$(RESET) to $(GREEN)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), ln -hfs $(CURDIR)/git/$(df) ~/.$(df);)

gitconfiguration:
	# Set up user Git configuration
	@[[ -e $(GITCONFIG_USER) ]] || touch $(GITCONFIG_USER)
	@USER_NAME=`git config --file $(GITCONFIG_USER) user.name`; \
	if [[ -z "$$USER_NAME" ]]; then \
		echo "What is your full name?"; read USER_NAME; \
		git config --file $(GITCONFIG_USER) user.name "$$USER_NAME"; \
	else \
		echo "$(BLUE)user.name="$$USER_NAME"$(RESET)"; \
	fi
	@USER_EMAIL=`git config --file $(GITCONFIG_USER) user.email`; \
	if [[ -z "$$USER_EMAIL" ]]; then \
		echo "What is your email?"; read USER_EMAIL; \
		git config --file $(GITCONFIG_USER) user.email "$$USER_EMAIL"; \
	else \
		echo "$(BLUE)user.email="$$USER_EMAIL"$(RESET)"; \
	fi
	@GITHUB_USER=`git config --file $(GITCONFIG_USER) github.user`; \
	if [[ -z "$$GITHUB_USER" ]]; then \
		echo "What is your GitHub username?"; read GITHUB_USER; \
		git config --file $(GITCONFIG_USER) github.user "$$GITHUB_USER"; \
	else \
		echo "$(BLUE)github.user="$$GITHUB_USER"$(RESET)"; \
	fi

uninstall: $(wildcard shells/*) $(wildcard vim/*) $(wildcard git/*)
	@echo "Unlink $(RED)[$^]$(RESET) from $(RED)[$(addprefix ~/.,$(^F))]$(RESET)"
	@$(foreach df, $(^F), rm -rf ~/.$(df))
