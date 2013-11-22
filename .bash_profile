### Customize prompt to show path in red, git branch and prompt character in red
export PS1='\[\e[0;31m\]\w\[\e[0m\] \[\e[0;33m\]`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`→ \[\e[0m\]'

export CLICOLOR=1

### If git completion script exists, enable it
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi
### If svn completion script exists, enable it
if [ -f ~/.svn-completion.bash ]; then
	. ~/.svn-completion.bash
fi

### Enable colourized output for listing directory contents, append '/' to directories, and extra symbols after various filetypes for differentiation
alias ls='ls -Fah'

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
