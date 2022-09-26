# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

if [ -f ~/.alias ]; then
  . ~/.alias
fi

# Disable bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi
 
#
# Set up the bash prompt display
#

PS1='[\h \W]$ '
PS1_HBAR="\342\224\200"
PS1_UL90="\342\224\214"
PS1_LL90="\342\224\224"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[94m\]${PS1_UL90}${PS1_HBAR}${PS1_HBAR}\[\033[0m\][\d \@ | \u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[34m\]\[\033[00m\]]\n\[\033[94m\]${PS1_LL90}${PS1_HBAR}> \[\033[0m\]"

# Make bash check its window size after a process completes
shopt -s checkwinsize

# Add colors to ls
alias ll="ls -la --color=auto"
alias ls="ls --color=auto"
alias tmux='tmux -2'
alias git_change_date='GIT_COMMITTER_DATE="$(date)" git commit --amend --no-edit --date "$(date)"'
alias git_change_author='git commit --amend --author="dakre21 <dakre21@gmail.com>" --no-edit'
alias python='python3'
alias pip='pip3'

ulimit -c unlimited
ulimit -s unlimited

export TERM=screen-256color
