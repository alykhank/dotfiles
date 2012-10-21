#customize prompt to show 'user@host' in green, current working directory in red, and prompt character in red
export PS1='\[\e[0;31m\][\u]\[\e[0m\] \[\e[0;33m\]\W \$ \[\e[0m\]'
#from IBM export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\H> \[\e[0m\]"

#enable colourized output for listing directory contents, append '/' to directories, and extra symbols after various filetypes for differentiation
alias ls='ls -GpF'

#instead of ls -G, may use CLICOLOR setting
#CLICOLOR=1
#export CLICOLOR
