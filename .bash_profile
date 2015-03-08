# Functions {{{
### Retrieve git branch name
function get_git_branch() {
  git branch | awk '/^\*/ { print $2 }'
}
### Retrieve git dirty state marker
function get_git_dirty() {
  git diff --quiet || echo '☢'
}

### Retrieve git metadata
function get_git_prompt() {
  git branch &> /dev/null || return 1
  echo " ($(get_git_branch))$(get_git_dirty)"
}

### Pretty print JSON files
function pprintjson() {
  [[ "$#" -eq 1 ]] || { echo "Usage: pprintjson infile.json"; return; }
  cat "$1" | python -m json.tool
}

### Generate ctags for current Git repo
function generate_ctags() {
  dir="`git rev-parse --git-dir`"
  git ls-files | ctags --tag-relative -L - -f "$dir/tags"
}

### Set flags for converting GitHub Markdown to HTML5 with Pandoc
function pandocmark() {
  [[ "$#" -eq 1 ]] || { echo "Usage: pandocmark infile.md"; return; }
  infile=$1
  outfile=$(basename "$infile")
  outfile=${outfile%.*}.html
  pandoc -f markdown_github -t html5 "$infile" -o "$outfile"
  open "$outfile"
}
# }}}

# Exports {{{
export CLICOLOR=1
export EDITOR='vim'
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
# }}}

# VCS Scripts {{{
### If git completion script exists, enable it
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi
### If git prompt script exists, enable it
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi
### If svn completion script exists, enable it
if [ -f ~/.svn-completion.bash ]; then
  source ~/.svn-completion.bash
fi
# }}}

# Prompt {{{
# Reset
Color_Off='\e[0m'       # Text Reset
# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Git PS1 Options {{{
# * indicates repo with unstaged changes
# + indicates repo with staged changes
GIT_PS1_SHOWDIRTYSTATE=1

# $ indicates repo with stashed changes
GIT_PS1_SHOWSTASHSTATE=1

# % indicates repo with untracked files
GIT_PS1_SHOWUNTRACKEDFILES=1

# see more information about the identity of commits checked out as a detached HEAD
GIT_PS1_DESCRIBE_STYLE="branch"

# colored hint about the current dirty state
GIT_PS1_SHOWCOLORHINTS=1

# show difference between HEAD and its upstream
# "<" indicates you are behind
# ">" indicates you are ahead
# "<>" indicates you have diverged
# "=" indicates that there is no difference
GIT_PS1_SHOWUPSTREAM="auto git"
# }}}

# Display path, git info, and prompt character
PROMPT_COMMAND='__git_ps1 "\[$Blue\]\w\[$Color_Off\]" "\[$White\]\\\$\[$Color_Off\] "'
# }}}

# Aliases {{{
### Enable colourized output for listing directory contents, append '/' to directories, and extra symbols after various filetypes for differentiation
alias ls='ls -Fah'

### Create shorthand for git
alias g='git'
__git_complete g __git_main
# }}}

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# vim:fdm=marker
