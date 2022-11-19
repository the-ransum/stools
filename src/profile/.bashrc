# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
		. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging fea:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -f $HOME/.bash_aliases ]; then
		. $HOME/.bash_aliases
fi

if [ -d ${HOME}/bin ]; then
		PATH="$PATH:${HOME}/bin"
fi
if [ -d ${HOME}/sbin ]; then
		PATH="$PATH:${HOME}/sbin"
fi

PS1="\$ "
