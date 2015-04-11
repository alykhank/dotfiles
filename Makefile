HOMEBREW_INSTALL_SCRIPT := ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
POWERLINE_FONT_URL := https://raw.githubusercontent.com/powerline/fonts/master/Meslo/Meslo%20LG%20S%20Regular%20for%20Powerline.otf
POWERLINE_FONT_FILE := ~/Library/Fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf
ECHO_RESET := \033[0m
ECHO_BLUE := \033[0;34m
GITCONFIG_USER := ~/.gitconfig_user

.PHONY: all cider submodules shells vim vimdotfiles vimplugins vimcompletion vimfonts git gitdotfiles gitconfiguration uninstall

all: cider submodules shells vim git

cider:
	# Install Homebrew if nonexistent
	@hash brew 2>/dev/null || $(HOMEBREW_INSTALL_SCRIPT)
	# Install Python and Pip via Homebrew if nonexistent
	@hash pip 2>/dev/null || brew install python
	# Install Cider if nonexistent
	@hash cider 2>/dev/null || pip install cider
	# Symlink $(CURDIR) to ~/.cider
	@ln -hfs $(CURDIR) ~/.cider
	# Restore Cider configuration if Cider is available
	@hash cider 2>/dev/null && cider restore

submodules:
	# Initialize and update Git submodules
	@git submodule update --init --recursive

shells: $(wildcard shells/*)
	# Symlink [$^] to [$(addprefix ~/.,$(^F))]
	@$(foreach df, $(^F), ln -hfs $(CURDIR)/shells/$(df) ~/.$(df);)

vim: vimdotfiles vimplugins vimfonts

vimdotfiles: $(wildcard vim/*)
	# Symlink [$^] to [$(addprefix ~/.,$(^F))]
	@$(foreach df, $(^F), ln -hfs $(CURDIR)/vim/$(df) ~/.$(df);)

vimplugins: vimdotfiles
	# Install Vim plugins
	@vim +PluginInstall +qall

vimfonts:
	# Install custom font for Vim statusline if nonexistent
	@[[ -e $(POWERLINE_FONT_FILE) ]] || curl $(POWERLINE_FONT_URL) -o $(POWERLINE_FONT_FILE); \
	echo "$(ECHO_BLUE)Font installs may require you to log out and log back in to take effect.$(ECHO_RESET)"

vimcompletion: vimplugins
	# Install YouCompleteMe with --clang-completer option
	@~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

git: gitdotfiles gitconfiguration

gitdotfiles: $(wildcard git/*)
	# Symlink [$^] to [$(addprefix ~/.,$(^F))]
	@$(foreach df, $(^F), ln -hfs $(CURDIR)/git/$(df) ~/.$(df);)

gitconfiguration:
	# Set up user Git configuration
	@if [[ ! -e $(GITCONFIG_USER) ]]; then \
		touch $(GITCONFIG_USER); \
	fi; \
	if [[ -z `git config --file $(GITCONFIG_USER) user.name` ]]; then \
		echo "What is your full name?"; \
		read user_name; \
		git config --file $(GITCONFIG_USER) user.name "$$user_name"; \
	else \
		echo "user.name=`git config --file $(GITCONFIG_USER) user.name`"; \
	fi; \
	if [[ -z `git config --file $(GITCONFIG_USER) user.email` ]]; then \
		echo "What is your email?"; \
		read user_email; \
		git config --file $(GITCONFIG_USER) user.email "$$user_email"; \
	else \
		echo "user.email=`git config --file $(GITCONFIG_USER) user.email`"; \
	fi; \
	if [[ -z `git config --file $(GITCONFIG_USER) github.user` ]]; then \
		echo "What is your GitHub username?"; \
		read github_user; \
		git config --file $(GITCONFIG_USER) github.user "$$github_user"; \
	else \
		echo "github.user=`git config --file $(GITCONFIG_USER) github.user`"; \
	fi

uninstall: $(wildcard shells/*) $(wildcard vim/*) $(wildcard git/*)
	# Unlink [$^] from [$(addprefix ~/.,$(^F))]
	@$(foreach df, $(^F), rm -rf ~/.$(df))
	# Uninstall custom font for Vim statusline
	@[[ -e $(POWERLINE_FONT_FILE) ]] && rm $(POWERLINE_FONT_FILE); \
	echo "$(ECHO_BLUE)Font uninstalls may require you to log out and log back in to take effect.$(ECHO_RESET)"
