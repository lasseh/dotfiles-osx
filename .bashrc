# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH="${PATH}:/usr/local/bin"

# ==> Default overrides
alias .='pwd'
alias ..='cd ..'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias df='df -h'
alias free='free -m'
#alias grep='grep --color=tty -d skip'

alias ls="\ls -hovA --indicator-style=file-type --color=always --group-directories-first --time=ctime"
alias lst="tree -C --du --si -L 5 --dirsfirst --prune"
alias ldot="\ls --indicator-style=file-type --color=always  -ld .*"

export EDITOR=vim
export PAGER=less

# ==> Grep colors
GREP_OPTIONS='--color=auto'
alias grep="grep $GREP_OPTIONS"
export GREP_COLORS="38;5;230:sl=38;5;240:cs=38;5;100:mt=38;5;161:fn=38;5;197:ln=38;5;212:bn=38;5;44:se=38;5;166"

function cd() {
	builtin cd $@; ls
}

PS1='\[\e[0;38;5;32m\]\u\[\e[0;38;5;163m\]@\[\e[0;38;5;35m\]\h\[\e[0;38;5;163m\]:\[\e[m\] \[\e[0;38;5;32m\]\w\[\e[m\] \[\e[0;2m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[m\]\n\[\e[0;38;5;163m\]>\[\e[m\] \[\e0'
