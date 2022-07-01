# This disables zsh_sessions as enabled by OS X
# For more information see /etc/zshrc_Apple_Terminal

SHELL_SESSIONS_DISABLE=1

if [[ -d $HOME/.cargo ]] ; then
	. "$HOME/.cargo/env"
fi