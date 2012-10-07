#customize prompt to show 'user@host' in green, current working directory in red, and prompt character in red
export PS1='\e[0;33m\][\u@\h]\e[m\] \e[0;31m\]\W \$ \e[m\]'

#enable colourized output for listing directory contents, append '/' to directories, and extra symbols after various filetypes for differentiation
alias ls='ls -GpF'

#instead of ls -G, may use CLICOLOR setting
#CLICOLOR=1
#export CLICOLOR
