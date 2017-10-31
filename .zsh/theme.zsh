# vim: ft=zsh
# ~/.zsh/oh-my.zsh

# oh-my-zsh Theme
# This also sets the prompt
ZSH_THEME="refined"
source "$HOME/.zsh/oh-my-zsh/$ZSH_THEME.zsh-theme"

# Base16 Colorscheme
SHELL_THEME="base16-unikitty-dark"
BASE16_SHELL="$HOME/.config/base16-shell/scripts/$SHELL_THEME.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL || _zwarn "Could not source theme"
