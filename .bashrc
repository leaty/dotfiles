#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '
#archey3

export TERM=xterm-256color 

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#	    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#	            eval "$("$BASE16_SHELL/profile_helper.sh")"

alias db1='mysql --defaults-file=$HOME/.mysql/db1.conf'
alias dots='git --git-dir=$HOME/.dots/ --work-tree=$HOME'
