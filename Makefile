SHELL := /bin/bash

.PHONY: all shells vim vcs submodules

all: shells vim vcs submodules

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
	@echo Installing Vim Plugins...; \
	vim +PluginInstall +qall
	@echo Installing YouCompleteMe with --clang-completer option...; \
	./.vim/bundle/YouCompleteMe/install.sh --clang-completer

vimfonts:
	curl https://raw.githubusercontent.com/powerline/fonts/master/Meslo/Meslo%20LG%20S%20Regular%20for%20Powerline.otf -o ~/Library/Fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf
	fc-cache -f ~/Library/Fonts/

vcs: .gitconfig .gitignore_global .git-completion.bash .svn-completion.bash
	@echo Removing $^; \
	$(foreach df, $^, rm -rf ~/$(df))
	@echo Installing $^; \
	$(foreach df, $^, ln -s $(CURDIR)/$(df) ~;)

submodules:
	git submodule init
	git submodule update --recursive
