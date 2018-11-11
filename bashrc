alias bws='ssh aviuser@10.140.4.50'
alias dev='ssh aviuser@10.10.22.189'
export PS1="\e[1;34m\u@\h \w> \e[m"
function tcap() {
   if (( $# != 2 ))
       then echo usage: tcap ip_address interface...;
   else
       ssh root@$1 "tcpdump -s 0 -Un -w - -i $2 " | wireshark -k -i -
   fi
}
function bldcs {
    loc=`git rev-parse --show-toplevel`
    cd $loc
    find $loc -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hh" -o -name "*.hpp" -o -name "*.py" -o -name "*.C" -o -name "*.CPP" -o -name "*.CC" -o -name "*.cc" -o -name "*.c++" -o -name "*.C++" -o -name "*.H"  -o -name "*.proto" -o -name "*.pyc"  -o -name "*.sh"  -o -name "*.SH" -o -name "*.conf"  -o -name "*.txt" -o -name "*.conf" -o -name "*.txt" -o -name "*.yaml" > cscope.files
    cscope -q -R -b -i cscope.files >/dev/null 2>&1
    ctags -L ./cscope.files >/dev/null 2>&1
    export CSCOPE_DB=$loc/cscope.out
    export CSTAGPATH=$ws/
}
export -f bldcs

## Show hidden files ##
alias l.='ls -d .* --color=auto'
alias bash='source ~/.bashrc'
## Colorize the ls output ##
alias ws='cd ~/ws'
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias c='clear'
alias cls='clear'
alias cs='cscope -d'
alias mkcd='_(){ mkdir $1; cd $1; }; _'
ulimit -c unlimited
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

function rmssh {
    ssh-keygen -f ~/.ssh/known_hosts -R $@
}
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
