# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# Git completion
if [ -f /etc/bash_completion.d/git ]; then
    source /etc/bash_completion.d/git
fi

# Show branch name in PS1
source ~/.git-prompt.sh

# Color define
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
RESET='\033[00;00m'

# Check host and source correct environment
DEV_TOOLS="/proj/cea/tools"
host_name=`hostname -s`

if [[ -d ${DEV_TOOLS}/dev-${host_name} ]]; then
    env_file="${DEV_TOOLS}/dev-${host_name}/env/setup-env.sh"
elif [[ -d ${DEV_TOOLS}/environments/env-${host_name} ]]; then
    env_file="${DEV_TOOLS}/environments/env-${host_name}/setup-env.sh"
else
    env_file="${DEV_TOOLS}/environments/env-default.sh"
fi

echo -e "\n[${GREEN}SRC${RESET}] ${env_file}\n"
source ${env_file}

# Git
export GIT_HOME=$COMMON_TOOLS/git/latest
export PATH=$GIT_HOME/bin:$PATH

# History settings
HISTFILESIZE=30000  # History in file
HISTSIZE=20000  # History in memory
HISTCONTROL=ignoredups  # Ignore duplicate commands
shopt -s histappend # Append history instead of rewriting it
PROMPT_COMMAND='history -a'
#shopt -s cmdhist    # Use one command per line

# Color man pages:
export LESS_TERMCAP_mb=$'\E[01;31m'      # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
export LESS_TERMCAP_me=$'\E[0m'          # end mode
export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m'   # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'          # end underline
export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline

# Aliases
alias grep='grep --color=auto'
alias less='less -L'
alias cop='rsync --progress -avh'
alias lh='ls -lh'
alias rm='rm -i'
alias du='du -kh'
alias df='df -kTh'

alias tree='~/development/bin/tree'
alias jq='~/development/bin/jq-linux64'

# Functions
#Find string in files recoursive
fbn() {
    find . -type f -exec grep -H "$1" {} \;
}

# Prompt
export PS1="\[\e[00;37m\][\u@\[\e[0m\]\[\e[00;32m\]\h\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;36m\]\w\[\e[0m\]\[\e[00;37m\]]\[\e[00;33m\]\$(__git_ps1)\[\e[00;37m\]\\$ \[\e[0m\]"

## Extra

# Pretty-print variables:
#alias path='echo -e ${PATH//:/\\n}'
#alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

# Directory coloring
#export LS_COLORS='di=94'

# Prompt
#export PS1="[\[\e[00;31m\]\u\[\e[0m\]@\[\e[00;37m\]\h\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;36m\]\w\[\e[0m\]\[\e[00;37m\]]\\$ \[\e[0m\]"


alias rlogin='/proj/cea/scripts/rlogin'
alias scp='scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias ssh='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias retro='/mnt/cea-proj/home/egyocza/cool-retro-term/cool-retro-term&'
export PS1="\u@\h:\w "
