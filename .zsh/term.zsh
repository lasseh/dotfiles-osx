# vim: ft=zsh
# This file is sourced by ~/.zshrc, it deals with terminal emulator settings.
# Particularly iTerm2 which has many cool shell integration features.

# Throw a warning TERM != xterm-256colors
if [[ "$TERM" != "xterm-256color" ]]; then
	_zwarn "TERM != xter-256colors - Pretty sure this isn't 1999"
fi

# Load iterm2 shell integration
if [[ -e "${HOME}/.iterm2_shell_integration.zsh" ]]; then
	source "${HOME}/.iterm2_shell_integration.zsh";
fi

# Example function for dynamically changing the iTerm2 banner. Not in use
iterm2_print_user_vars() {
	iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}
