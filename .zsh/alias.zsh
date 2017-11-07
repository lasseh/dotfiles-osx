# ~/.zsh/alias.zsh

# ==> Default overrides
alias .='pwd'
alias ..='cd ..'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias nc='nc -v -w 3'
alias sloc="find . -name '*.go' | xargs wc -l"


# ==> Folder shortcuts
alias c='cd $HOME/code/go/src/github.com/lasseh'
alias wh='cd $HOME/code/go/src/github.com/webhuset'

# ==> Tmux shortcuts
# to create dev/tech session: tmux new-session -s dev
alias tmuxa='tmux attach -t 0'
alias tmuxad='tmux attach -d -t 0'
alias tmuxdev='tmux attach -d -t dev'
alias tmuxnet='tmux attach -d -t net'
alias tmuxtech='tmux attach -d -t tech'

# ncurses fix
alias irssi='TERM=screen-256color irssi'
alias htop='TERM=screen-256color htop'
alias weechat='TERM=screen-256color weechat-curses'

# ==> Git
alias ga='git add'
alias gpush='git push origin master'
alias gpull='git pull'
alias gd='git diff --color --no-ext-diff'
alias gdstat='git diff --color --stat'
alias gits='git status -sb'
alias gg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gits='git status -sb'
alias gcm='git commit --message'
alias gitbranches="git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"
alias gcpush='git commit -a -m && git push origin'
alias gundo='git reset --soft HEAD~1'
alias gupdatesubm='git pull --recurse-submodules && git submodule update --recursive --remote'

# ==> Listing aliases
if which exa &>/dev/null; then
	alias ls="exa --group-directories-first --git --color-scale -mghas Name --long"
	alias lst="exa --group-directories-first --git --tree --color-scale -mghs Name --long"
	alias xa="exa"
	alias le="exa -lrhgHBimUa --git --group-directories-first"
else
	alias ls="\ls -hovA --indicator-style=file-type --color=always --group-directories-first --time=ctime"
	alias lst="tree -C --du --si -L 5 --dirsfirst --prune"
	alias ldot="\ls --indicator-style=file-type --color=always  -ld .*"
fi

# Color Cat
# Install: go get -u github.com/jingweno/ccat
if which ccat &>/dev/null; then
	alias cat="ccat"
fi

# # ==> Utilities
alias randpasswd="LANG=c < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16};echo;"
