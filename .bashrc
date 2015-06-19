# -*- shell-script -*-
#---------------------------------------------------------------------#
# .bashrc
#---------------------------------------------------------------------#
# 
# administration commands
# add a user:
# 1. /usr/sbin/useradd user_id -g group_id -d home_dir
# 2. passwd user_id
# 3. usermod -g/-a -G group username , change/add user group (or edit /etc/group)
#   usermod -a -G group userid, or edit /etc/group directly
# 4. chgrp admin dir, change dir's group to admin

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
export HISTTIMEFORMAT="%m/%d/%y %T "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

color_prompt=yes
#PS1 color setting format: \[\e;Frontground;Background;Cm\]
#\d is date, \H is full hostname, \t is 24 hours, \T is 12 hours, \u is the username,
#\v is the bash version, \w is the full directory, \W is the current directory
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep -n --color=auto'
    alias fgrep='fgrep -n --color=auto'
    alias egrep='egrep -n --color=auto'
fi

# some more ls aliases

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
#---------------------------------------------------------------------#
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export LS_COLORS='no=00:fi=00:di=00;35:ln=00;36:pi=40;33:so=00;35:do=00;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.jpg=00;35:*.jpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.mov=00;35:*.mpg=00;35:*.mpeg=00;35:*.avi=00;35:*.fli=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.ogg=00;35:*.mp3=00;35:*.wav=00;35:'

#---------------------------------------------------------------------#
# Global Environmental variables
#	This is where you set up your default printer and editor
#
#	umask controls the permissions of files you create. The various 
#	levels are as follows:
#		022	-rw-r--r--	-rwxr-xr-x
#		077	-rw-------	-rwx------
#---------------------------------------------------------------------#
# replace XX with the number of your favorite printer
# Default editor
export EDITOR=vim
export SVN_EDITOR=vim

umask 002
#export hostname=`hostname`

#---------------------------------------------------------------------#
# Paths
#---------------------------------------------------------------------#
export PATH=/usr/bin:/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/X11R6/bin:/usr/local/sbin:~/bin:.

export TERM=xterm
export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:~/lib
export LD_PRELOAD=/usr/lib/libtcmalloc.so
#------------------------------------------------------------------#
# Interactive terminal settings and environment variables
#------------------------------------------------------------------#
stty echoe
stty erase "^?"
stty werase ""
stty kill ""
set filec
set ignoreeof
set noclobber
set notify
set nobeep

#------------------------------------------------------------------#
#          settings  for interactive shells
#------------------------------------------------------------------#
set history=100
alias setprompt='export PS1="\u@\h \W\\>"'
alias settitle='echo -n ""'

alias ls='ls -Fh --color=auto'
#attention, when I alias grep as 'grep -E -inr --color=auto', it always return some irreasonable results.
#so I use the new alias.
alias grep='grep -nE --color=auto'
alias ag='ag -SU --column'
alias free='free -m'
alias vi='vim.gtk'
alias vim='gvim -c "call MaximizeWindow()"'
alias gdb='gdb -quiet'
# if you find the font and window are strange, just use 'gvim -p'
export VIMRUNTIME=/usr/share/vim/vim74
export VIMHOME=~/.vim
#
#------------------------------------------------------------------#
#          Aliases  for interactive shells
#------------------------------------------------------------------#
alias cp='cp -rf'
alias mv='mv -v'
function del() { mv "$@" ~/dustbin; }

alias psrun='ps -a | grep -v "0.00"'
alias psr='ps -a -o user,pid,pcpu,pmem,vsz,rss,time,comm | more | grep -v "0.00"'
#alias find='find . -name'
alias du='du -shx'
alias df='df -h'
alias h='history \!* | less'
alias xw='xterm -sl 500 -sb -fn 10x20  -bd Red -ms #ffffff -cr #ffffff -fg white -bg #00204f -g 80x25 &'
alias xt='xterm -sl 500 -sb -fn 10x20  -bd Red -ms #ffffff -cr #ffffff -bg Black -fg green -g 80x25 &'
alias la='ls -lFah'
alias ll='ls -l'
alias lt='ls -th'
alias llt='ls -lht'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias vncserver='vncserver -geometry 1270x970'
alias vncserversmall='vncserver -geometry 1024x768'
alias killp='ps -ouid -C \!* | kill -9'
#alias valgrind='valgrind --tool=memcheck --log-file=memcheck.log --leak-check=full --track-origins=yes -v'
alias ct='ctags -R --sort=yes --fields=+ialS --extra=+q --c-kinds=+p --c++-kinds=+px \
                 --exclude=*.txt,*.log,obj/,bin/,doc/' 
alias cs='cscope -Rbqk'
alias mkdir='mkdir -pv'
alias rm='rm -v'
alias wc='wc -l'
alias less='less -r'
alias gl='git gl'
alias fdisk='fdisk -l'
alias make='make -j8'
alias py='python'
alias gvd='gvimdiff'
alias fortran='gfortran'
alias gcc='gcc -Wall -O0'
alias g++='g++ -Wall -O0'
# sudo apt-get install dstat
alias dstat='dstat -cdlmnpsy'
export TCL_HOME=/usr
#gcc complier
export COMPILER_PATH=/usr/bin
#lefdef parser
export LEFDEF_HOME=$HOME/lib/deflef
# add for supporting powerline
. /usr/share/powerline/bindings/bash/powerline.sh
