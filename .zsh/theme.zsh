# vim: ft=zsh
# ~/.zsh/oh-my.zsh

# Zsh Theme
ZSH_THEME="refined"
source "$HOME/.config/oh-my-zsh/themes/$ZSH_THEME.zsh-theme"

# Base16 Colorscheme
SHELL_THEME="base16-unikitty-dark"
BASE16_SHELL="$HOME/.config/base16-shell/scripts/$SHELL_THEME.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL || _zwarn "Could not source theme"

# Grep colors
GREP_OPTIONS='--color=auto'
GREP_COLORS="38;5;230:sl=38;5;240:cs=38;5;100:mt=38;5;161:fn=38;5;197:ln=38;5;212:bn=38;5;44:se=38;5;166"
export GREP_OPTIONS
export GREP_COLORS
