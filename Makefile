SHELL := /bin/bash

all: shells vim vcs submodules

shells: .bash_profile .inputrc .ackrc
	@echo Removing $^; \
	$(foreach df, $^, rm -rf ~/$(df))
	@echo Installing $^; \
	$(foreach df, $^, ln -s $(CURDIR)/$(df) ~; )

vim: .vim .vimrc .gvimrc
	@echo Removing $^; \
	$(foreach df, $^, rm -rf ~/$(df))
	@echo Installing $^; \
	$(foreach df, $^, ln -s $(CURDIR)/$(df) ~; )

vcs: .gitconfig .gitignore_global .git-completion.bash .svn-completion.bash
	@echo Removing $^; \
	$(foreach df, $^, rm -rf ~/$(df))
	@echo Installing $^; \
	$(foreach df, $^, ln -s $(CURDIR)/$(df) ~; )

submodules:
	git submodule init
	git submodule update --recursive

osx: .osx
	@echo Removing $^; \
	$(foreach df, $^, rm -rf ~/$(df))
	@echo Installing $^; \
	$(foreach df, $^, ln -s $(CURDIR)/$(df) ~; )
	@echo Running .osx; \
	sh ~/.osx
