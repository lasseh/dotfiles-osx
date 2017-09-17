# ~/.zsh/vars.zsh
# This file is sourced early by ~/.zshrc, it defines global environment variables

# ==> Environment
DISPLAY=:0.0
EDITOR="vim"				# Use vim as the editor
PAGER="less"				# Use less as the default pager

# ==> zsh plugins / Oh my zsh
#ZSH="${HOME}/.config/oh-my-zsh"
#ZSH_THEME="norm"

#_Z_DATA="$HOME/.config/.z"

# ==> Time & Language
LC_ALL="en_US.UTF-8"
LANG="en_US.UTF-8"
LANGUAGE="en_US.UTF-8"
TZ="Europe/Oslo"


# ==> Set Golang's GOPATH
test -d "${HOME}/code/go" && GOPATH="${HOME}/code/go"
#test -d "${HOME}/Projects/Gopath" && GOPATH="${HOME}/Projects/Gopath"
#test -d "${HOME}/Projects/go" && GOPATH="${HOME}/Projects/go"

# ==> System Paths
# The PATH variable varies from system to system which means
# we need to do some checks to get a somewhat sane value.
# On macOS we also wish to avoid using the bundled BSD core 
# utilities so we make sure the brew-installed core-utilities
# takes precedense if available.
if [[ -d "/usr/local/opt/coreutils/libexec/gnubin" ]]; then
       PATH="/usr/local/opt/coreutils/libexec/gnubin"
fi

test -d /usr/local/bin 	&& PATH="${PATH}:/usr/local/bin"
test -d /usr/local/sbin && PATH="${PATH}:/usr/local/sbin"
test -d /sbin 		&& PATH="${PATH}:/sbin"
test -d /usr/sbin 	&& PATH="${PATH}:/usr/sbin"
test -d /bin 		&& PATH="${PATH}:/bin"
test -d /usr/bin 	&& PATH="${PATH}:/usr/bin"
test -d "${HOME}/bin" 	&& PATH="${PATH}:${HOME}/bin"
test -d "${HOME}/sbin" 	&& PATH="${PATH}:${HOME}/sbin"


test -d "/usr/local/go/bin" 	&& PATH="${PATH}:/usr/local/go/bin"
test -d "${GOPATH}/bin" 	&& PATH="${PATH}:${GOPATH}/bin"

test -d "/opt/local/share/man" && \
	MANPATH="$MANPATH:/opt/local/share/man"
test -d "/usr/local/opt/coreutils/libexec/gnuman" && \
	MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"

# Save to this file
HISTFILE=~/.history

# Remember 15k lines
SAVEHIST=15000
HISTSIZE=15000

export 	PATH GOPATH EDITOR PAGER LC_ALL \
	LANG LANGUAGE TZ DISPLAY MANPATH \
	SAVEHIST HISTSIZE HISTFILE

