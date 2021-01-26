#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#####################################
#     _    _ _                      #
#    / \  | (_) __ _ ___  ___  ___  #
#   / _ \ | | |/ _` / __|/ _ \/ __| #
#  / ___ \| | | (_| \__ \  __/\__ \ #
# /_/   \_\_|_|\__,_|___/\___||___/ #
#				    #
#####################################

# Switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'" 
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'" 

# ls, but nicer 
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'		# I Use Arch Linux btw

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

# grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# add new fonts
alias update-fc='sudo fc-cache -fv'

# hardware info --short
alias hw="hwinfo --short"

# check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

# Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'  # remove orphaned packages

# get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# gpg
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"

# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# Reboot or shutdown
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

# Grep 
alias grep='grep --color=auto -n'

# Changing "cat" command to "bat"
alias cat='bat --theme=Dracula'

# Tree
alias tree='tree -C'

# dir reminds me of Windows 
alias vdir='vdir -Al --color=always --group-directories-first'

# Clear
alias c='clear'		#Yes, I'm that lazy 

# Copy command
alias cp='cp -v'

# Use the system config if it exists
if [ -f /etc/bashrc ]; then
    . /etc/bashrc        # --> Read /etc/bashrc, if present.
elif [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc   # --> Read /etc/bash.bashrc, if present.
fi

# The following lines are only for interactive shells
[[ $- = *i* ]] || return

# Use Bash completion, if installed
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Move command option
alias mv='mv -v'

# Lightdm settings
alias liset='sudo lightdm-gtk-greeter-settings'

# Colors
export PS1="\[\033[38;5;9m\][\[$(tput sgr0)\]\[\033[38;5;227m\]\u\[$(tput sgr0)\]\[\033[38;5;35m\]@\[$(tput sgr0)\]\[\033[38;5;33m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;141m\]\w\[$(tput sgr0)\]\[\033[38;5;9m\]]\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"

# Colorize man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

