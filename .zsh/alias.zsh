# ~/.zsh/alias.zsh

# ==> Default overrides
alias .='pwd'
alias ..='cd ..'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'

# ==> Folder shortcuts
alias c='cd $HOME/code/go/src/github.com/lasseh'

# ==> Tmux shortcuts
# to create dev/tech session: tmux new-session -s dev
alias tmuxa='tmux attach -t 0'
alias tmuxx='tmux new-session -t 0'
alias tmuxad='tmux attach -d -t 0'
alias tmuxdev='tmux new-session -t dev'
alias tmuxdevd='tmux attach -d -t dev'
alias tmuxnet='tmux new-session -t net'
alias tmuxnetd='tmux attach -d -t net'
alias tmuxtech='tmux new-session -t tech'
alias tmuxtechd='tmux attach -d -t tech'

# ==> Git
alias ga='git add'
alias gpush='git push origin master'
alias gpull='git pull'
alias gd='git diff --color --no-ext-diff'
alias gdstat='git diff --color --stat'
alias gits='git status -sb'
#alias gg='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias gg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gits='git status -sb'
alias gcm='git commit --message'
alias gitbranches="git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"
alias gcpush='git commit -a -m && git push origin'
alias gundo='git reset --soft HEAD~1'
alias gupdatesubm='pull --recurse-submodules && git submodule update --recursive --remote'


# ==> Listing aliases
if which exa &>/dev/null; then
	alias ls="exa --group-directories-first --git --color-scale -mghrs size"
	alias lst="exa --group-directories-first --git --tree --color-scale -mghrs size"
	alias xa="exa"
	alias le="exa -lrhgHBimU --git --group-directories-first"
else
	alias ls="\ls -lFhX --indicator-style=file-type --color=always --time=ctime"
	alias lst="tree -C --du --si -L 5 --dirsfirst --prune"
	alias ldot="\ls --indicator-style=file-type --color=always  -ld .*"
fi

# # ==> Utilities
alias randpasswd="LANG=c < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16};echo;"
