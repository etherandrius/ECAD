# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes # uncommented by aagg on 22/10/2017

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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
    #test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=38;5;216:warning=38;5;175:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


export W="/mnt/c/Users/ag939"
export w="/mnt/c/Users/ag939"
export c="/mnt/c/Users/ag939/cambridge"
export C="/mnt/c/Users/ag939/cambridge"

LS_COLORS='rs=0:di=38;5;113:ln=01;36:mh=00:pi=40;33:so=38;5;175:do=38;5;175:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=7;38;5;151:ow=38;5;113:st=37;44:ex=38;5;181:*.tar=38;5;216:*.tgz=38;5;216:*.arj=38;5;216:*.taz=38;5;216:*.lzh=38;5;216:*.lzma=38;5;216:*.tlz=38;5;216:*.txz=38;5;216:*.zip=38;5;216:*.z=38;5;216:*.Z=38;5;216:*.dz=38;5;216:*.gz=38;5;216:*.lz=38;5;216:*.xz=38;5;216:*.bz2=38;5;216:*.bz=38;5;216:*.tbz=38;5;216:*.tbz2=38;5;216:*.tz=38;5;216:*.deb=38;5;216:*.rpm=38;5;216:*.jar=38;5;216:*.war=38;5;216:*.ear=38;5;216:*.sar=38;5;216:*.rar=38;5;216:*.ace=38;5;216:*.zoo=38;5;216:*.cpio=38;5;216:*.7z=38;5;216:*.rz=38;5;216:*.jpg=38;5;175:*.jpeg=38;5;175:*.gif=38;5;175:*.bmp=38;5;175:*.pbm=38;5;175:*.pgm=38;5;175:*.ppm=38;5;175:*.tga=38;5;175:*.xbm=38;5;175:*.xpm=38;5;175:*.tif=38;5;175:*.tiff=38;5;175:*.png=38;5;175:*.svg=38;5;175:*.svgz=38;5;175:*.mng=38;5;175:*.pcx=38;5;175:*.mov=38;5;175:*.mpg=38;5;175:*.mpeg=38;5;175:*.m2v=38;5;175:*.mkv=38;5;175:*.webm=38;5;175:*.ogm=38;5;175:*.mp4=38;5;175:*.m4v=38;5;175:*.mp4v=38;5;175:*.vob=38;5;175:*.qt=38;5;175:*.nuv=38;5;175:*.wmv=38;5;175:*.asf=38;5;175:*.rm=38;5;175:*.rmvb=38;5;175:*.flc=38;5;175:*.avi=38;5;175:*.fli=38;5;175:*.flv=38;5;175:*.gl=38;5;175:*.dl=38;5;175:*.xcf=38;5;175:*.xwd=38;5;175:*.yuv=38;5;175:*.cgm=38;5;175:*.emf=38;5;175:*.axv=38;5;175:*.anx=38;5;175:*.ogv=38;5;175:*.ogx=38;5;175:*.aac=38;5;30:*.au=38;5;30:*.flac=38;5;30:*.mid=38;5;30:*.midi=38;5;30:*.mka=38;5;30:*.mp3=38;5;30:*.mpc=38;5;30:*.ogg=38;5;30:*.ra=38;5;30:*.wav=38;5;30:*.axa=38;5;30:*.oga=38;5;30:*.spx=38;5;30:*.xspf=38;5;30:*.java=204;38;5'; export LS_COLORS
export PS1='${debian_chroot:+($debian_chroot)}\[\033[38;5;147m\]\u@:\[\033[38;5;49m\]\w$ '

