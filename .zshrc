# vim: ft=zsh
# File: ~/.zshrc

# Set a resonable umask, we'd rather explicitly share
# share stuff with our neighbours.
umask 077

# Pretty warnings
function _zwarn() { echo -ne "\e[38;5;196mWARNING \e[38;5;208m~>\e[0m $1\n"; }

source "${HOME}/.zsh/alias.zsh"         || _zwarn "Could not source ~/.zsh/alias.zsh"
source "${HOME}/.zsh/man.zsh"         || _zwarn "Could not source ~/.zsh/man.zsh"
source "${HOME}/.zsh/settings.zsh"      || _zwarn "Could not source ~/.zsh/settings.zsh"
source "${HOME}/.zsh/term.zsh"          || _zwarn "Could not source ~/.zsh/term.zsh"
source "${HOME}/.zsh/theme.zsh"          || _zwarn "Could not source ~/.zsh/theme.zsh"
source "${HOME}/.zsh/vars.zsh"          || _zwarn "Could not source ~/.zsh/vars.zsh"
source "${HOME}/.zsh/functions.zsh"          || _zwarn "Could not source ~/.zsh/functions.zsh"
source "${HOME}/.zsh/completion.zsh"          || _zwarn "Could not source ~/.zsh/completion.zsh"
source "${HOME}/.zsh/termsupport.zsh"          || _zwarn "Could not source ~/.zsh/termsupport.zsh"
source "${HOME}/.zsh/fzf.zsh"          || _zwarn "Could not source ~/.zsh/fzf.zsh"

# oh-my-zsh plugins
source "${HOME}/.zsh/oh-my-zsh/osx.plugin.zsh"         		|| _zwarn "Could not source osx plugin"

# Path to your zsh configuration.
ZSH=$HOME/.zsh

# ==> Key bindings
bindkey -v
bindkey '^e' end-of-line
bindkey '^a' beginning-of-line
bindkey '^r' history-incremental-search-backward

# Load dircolors for ls, tree, etc.
if which dircolors &>/dev/null; then
	eval $(dircolors -b ~/.dircolors)
else
	_zwarn "Install the \`dircolors\` utility to get fancy colors for ls, tree, etc."
fi

# Iterm2 Integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

