#
# ~/.bash_profile
#

PATH=~/.local/bin:~/.cargo/bin:$PATH

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
