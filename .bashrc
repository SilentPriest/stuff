#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -a -l'
alias la='ls -a'

PS1='[\u@\h \W]\$ '

export http_proxy='10.0.2.2:3128'
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export rsync_proxy=$http_proxy
export SVN_EDITOR=vim


