# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

alias ll='ls -alF'

export PS1="\[\e[32m\]\u\[\e[m\]@\[\e[35m\]\h\[\e[m\]:\[\e[33m\]\w\[\e[m\]\\$ "

alias hgrep='history | grep'

export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups
shopt -s histappend

#source <(kubectl completion bash)
#complete -F __start_kubectl k  

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'


