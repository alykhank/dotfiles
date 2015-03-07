SHELL := /bin/bash

.PHONY: all submodules shells vim vimdotfiles vimplugins vimcompletion vimfonts vcs vcsdotfiles gitconfiguration

all: submodules shells vim vcs

submodules:
	git submodule init
	git submodule update --recursive

shells: .bash_profile .inputrc .ackrc
	@echo Removing $^; \
	$(foreach df, $^, rm -rf ~/$(df))
	@echo Installing $^; \
	$(foreach df, $^, ln -s $(CURDIR)/$(df) ~;)

vim: vimdotfiles vimplugins vimfonts

vimdotfiles: .vim .vimrc .gvimrc
	@echo Removing $^; \
	$(foreach df, $^, rm -rf ~/$(df))
	@echo Installing $^; \
	$(foreach df, $^, ln -s $(CURDIR)/$(df) ~;)

vimplugins:
	@echo "Installing Vim Plugins..."; \
	vim +PluginInstall +qall

vimcompletion:
	@echo "Installing YouCompleteMe with --clang-completer option..."; \
	./.vim/bundle/YouCompleteMe/install.sh --clang-completer

vimfonts:
	@if [[ ! -e ~/Library/Fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf ]]; then \
		echo "Installing Vim Fonts..."; \
		curl https://raw.githubusercontent.com/powerline/fonts/master/Meslo/Meslo%20LG%20S%20Regular%20for%20Powerline.otf -o ~/Library/Fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf; \
		fc-cache -f ~/Library/Fonts/; \
	fi

vcs: vcsdotfiles gitconfiguration

vcsdotfiles: .gitconfig .gitignore_global .git-completion.bash .svn-completion.bash
	@echo Removing $^; \
	$(foreach df, $^, rm -rf ~/$(df))
	@echo Installing $^; \
	$(foreach df, $^, ln -s $(CURDIR)/$(df) ~;)

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
