# For kcd
KCD_INIT="/etc/profile.d/kcd.sh"
if [ -e "$KCD_INIT" ]; then
	. "$KCD_INIT"
fi

# z (Jump directories)
source ~/.zsh/ext/z/z.sh
alias zc='z -c'

# Aliases
alias ll='ls --color=auto -al --group-directories-first'
alias md='mkdir'
alias nh='nohup 2>/dev/null'
if whence detach > /dev/null; then
  alias det='detach'
elif whence setsid; then
  alias det='setsid 2>/dev/null'
else
  alias det='nohup 2>/dev/null' 
fi

lm() {
  ls --color -al --group-directories-first $* | less -R
}

agenv () {
  source ~/proj/agenv
}

agld () {
  export LD_LIBRARY_PATH=/opt/pkg/agat/lib
}

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]
  then
    bg
  zle redisplay
  else
    zle push-input
  fi
}

zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

