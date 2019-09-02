#
# ~/.bashrc
#

# Script vars
export MONITOR1='DP-2'
export MONITOR2='HDMI-0'
export SCREEN_X=1920
export SCREEN_Y=1080

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '
#archey3

# Vars
export TERM=xterm-256color
#export TERM=screen-256color
#export TERM=rxvt-unicode-256color
export EDITOR=vim
export SYSTEMD_EDITOR=vim
export RANGER_LOAD_DEFAULT_RC=false
export FZF_DEFAULT_OPTS='
	--color bg:-1
	--color bg+:-1
	--color prompt:-1
'

PATH=$PATH:~/.local/bin

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#	    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#	            eval "$("$BASE16_SHELL/profile_helper.sh")"

alias db1='mysql --defaults-file=$HOME/.mysql/db1.conf'
alias dots='git --git-dir=$HOME/.dots/ --work-tree=$HOME'
alias vbg='xwinwrap -g 1920x1080 -ov -ni -s -nf -- mpv --vo=vdpau --mute=yes --loop --wid WID'
alias ccat='vimcat'
alias vim='nvim'
alias code="vim -S ~/.vim/session/orion"

# Pywal
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
