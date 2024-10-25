# FZF
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS=''
alias j='cd'
alias ji='cdi'
alias :q='exit'

# GENERAL
#set -o vi
alias docker-killall='docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q)'
alias ls='ls --color=auto'
export PATH="$HOME/.cargo/bin:$PATH"
export PROMPT_COMMAND='history -a'
export EDITOR="/usr/bin/nvim"
export VISUAL="$EDITOR"
export HISTSIZE="100000"
export HISTFILESIZE="$HISTSIZE"
export HISTTIMEFORMAT="[%Y-%m-%d %T]  "
export HISTCONTROL="ignoredups"
function cdev() {
    clang -Weverything -g -O0 ${1}
    clang --analyze -Xanalyzer -analyzer-output=text ${1}
    echo ""
    ./a.out
}

# PROMPT
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1)/"
}
export PS1="\n \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# ZOXIDE
eval "$(zoxide init bash --cmd cd)"
