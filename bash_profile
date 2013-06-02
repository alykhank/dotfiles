### Customize prompt to show 'user@host' in green, current working directory in red, and prompt character in red
export PS1='\[\e[0;31m\][\u]\[\e[0m\] \[\e[0;33m\]\W \$ \[\e[0m\]'
#from IBM export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\H> \[\e[0m\]"
export CLICOLOR=1

### If git completion script exists, enable it
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi
### If svn completion script exists, enable it
if [ -f ~/.svn-completion.bash ]; then
	. ~/.svn-completion.bash
fi

### Set environment variables for Android SDK, EDITOR
export ANDROID_SDK="/usr/local/android/"
export PATH="/usr/local/bin:/usr/local/share/python:/usr/local/sbin:$PATH:/usr/local/android/tools:/usr/local/android/platform-tools"
export EDITOR="mvim -v"

### Enable colourized output for listing directory contents, append '/' to directories, and extra symbols after various filetypes for differentiation
alias ls='ls -Fah'
### Use terminal mvim instead of vim (provides clipboard support)
alias vim=$EDITOR

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
