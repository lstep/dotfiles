#function parse_git_branch {
#  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#}

function get_repository {
    pwd | grep $HOME'/workspace/.*' | awk -F/ '{print "("$5")"}'
}
function get_branch {
    /usr/bin/git branch 2> /dev/null | grep \* | awk '{print "("$2")"}'
}
 
function proml {
  local       BLACK="\[\033[0;30m\]"
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac
 
PS1="${TITLEBAR}\
$BLUE[$RED\$(date +%H:%M)$BLUE]\
$BLUE[$LIGHT_GRAY\u@\h:\w$GREEN\$(get_repository)\$(get_branch)$BLUE]\n\
$GREEN\$$WHITE "
PS2='> '
PS4='+ '
}
proml
