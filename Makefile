SHELL := /bin/bash

.PHONY: all cider submodules shells vim vimdotfiles vimplugins vimcompletion vimfonts git gitdotfiles gitconfiguration uninstall

all: cider submodules shells vim git

cider:
	@if !hash brew 2>/dev/null; then \
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; \
	fi; \
	if !hash pip 2>/dev/null; then \
		brew install python; \
	fi; \
	if !hash cider 2>/dev/null; then \
		pip install cider; \
	fi; \
	ln -hfs $(CURDIR) ~/.cider; \
	cider restore

submodules:
	git submodule update --init --recursive

shells: $(wildcard shells/*)
	@echo Removing $(^F); \
	$(foreach df, $(^F), rm -rf ~/.$(df))
	@echo Installing $(^F); \
	$(foreach df, $(^F), ln -s $(CURDIR)/shells/$(df) ~/.$(df);)

vim: vimdotfiles vimplugins vimfonts

vimdotfiles: $(wildcard vim/*)
	@echo Removing $(^F); \
	$(foreach df, $(^F), rm -rf ~/.$(df))
	@echo Installing $(^F); \
	$(foreach df, $(^F), ln -s $(CURDIR)/vim/$(df) ~/.$(df);)

vimplugins:
	@echo "Installing Vim Plugins..."; \
	vim +PluginInstall +qall

vimcompletion:
	@echo "Installing YouCompleteMe with --clang-completer option..."; \
	~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

vimfonts:
	@if [[ ! -e ~/Library/Fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf ]]; then \
		echo "Installing Vim Fonts..."; \
		curl https://raw.githubusercontent.com/powerline/fonts/master/Meslo/Meslo%20LG%20S%20Regular%20for%20Powerline.otf -o ~/Library/Fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf; \
		echo "Font installs may require you to log out and log back in to take effect."; \
	fi

git: gitdotfiles gitconfiguration

gitdotfiles: $(wildcard git/*)
	@echo Removing $(^F); \
	$(foreach df, $(^F), rm -rf ~/.$(df))
	@echo Installing $(^F); \
	$(foreach df, $(^F), ln -s $(CURDIR)/git/$(df) ~/.$(df);)

gitconfiguration:
	@echo "Setting up global Git configuration...";
	@if [[ -z `git config --global user.name` ]]; then \
		echo "What is your full name?"; \
		read user_name; \
		git config --global user.name "$$user_name"; \
	else \
		echo "user.name=`git config --global user.name`"; \
	fi
	@if [[ -z `git config --global user.email` ]]; then \
		echo "What is your email?"; \
		read email; \
		git config --global user.email "$$email"; \
	else \
		echo "user.email=`git config --global user.email`"; \
	fi
	@if [[ -z `git config --global github.user` ]]; then \
		echo "What is your GitHub username?"; \
		read github_user; \
		git config --global github.user "$$github_user"; \
	else \
		echo "github.user=`git config --global github.user`"; \
	fi

uninstall: $(wildcard shells/*) $(wildcard vim/*) $(wildcard git/*)
	@echo Removing $(^F); \
	$(foreach df, $(^F), rm -rf ~/.$(df))
	@if [[ -e ~/Library/Fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf ]]; then \
		echo "Uninstalling Vim Fonts..."; \
		rm ~/Library/Fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf; \
		echo "Font uninstalls may require you to log out and log back in to take effect."; \
	fi
