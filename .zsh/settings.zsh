# ~/.zsh/settings.zsh

autoload -U compinit promptinit zcalc zsh-mime-setup
compinit
promptinit
zsh-mime-setup

# Pipe to multiple outputs
setopt MULTIOS

# Makes cd => pushd
setopt AUTO_PUSHD

# Use named dres whne possible
setopt AUTO_NAME_DIRS

# Expandglob
setopt GLOB_COMPLETE

# Unknown directives
setopt PUSHD_MINUS
setopt NUMERIC_GLOB_SORT
setopt NO_CASE_GLOB
setopt EXTENDED_GLOB
setopt ZLE
setopt VI

# Don't overwrite, append!
setopt APPEND_HISTORY

# Write after each command
setopt INC_APPEND_HISTORY

# Killer: share history between multiple shells
setopt SHARE_HISTORY

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS

# Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

# Don't save duplicate history entries
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' list-separator 'fREW'

