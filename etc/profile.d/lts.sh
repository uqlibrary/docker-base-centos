# color escape codes
normal="\[\e[0m\]"
nobg="m\]"
blackbg=";40m\]"
redbg=";41m\]"
greenbg=";42m\]"
brownbg=";43m\]"
bluebg=";44m\]"
magentabg=";45m\]"
cyanbg=";46m\]"
greybg=";47m\]"
black="\[\e[0;30$nobg"
redfaint="\[\e[0;31$nobg"
greenfaint="\[\e[0;32$nobg"
brownfaint="\[\e[0;33$nobg"
bluefaint="\[\e[0;34$nobg"
magentafaint="\[\e[0;35$nobg"
cyanfaint="\[\e[0;36$nobg"
greyfaint="\[\e[0;37$nobg"
grey="\[\e[1;30$nobg"
red="\[\e[1;31$nobg"
green="\[\e[1;32$nobg"
yellow="\[\e[1;33$nobg"
blue="\[\e[1;34$nobg"
magenta="\[\e[1;35$nobg"
cyan="\[\e[1;36$nobg"
white="\[\e[1;37$nobg"
bold="\[\e[1$nobg"

# prompt pieces
prompt_open="$blue[$normal"
prompt_close="$blue]$normal"
prompt_close_open="$prompt_close$prompt_open"
prompt_username="$cyan\u$normal"
prompt_at="$blue@$normal"
prompt_hostname="$cyan\h$normal"
prompt_jobs="$cyan\j$normal"
prompt_time="$cyan\t$normal"
prompt_pwd="$magenta\w$normal"
prompt_cmd_num="$blue\#$normal"
prompt_err_stat="$bold$?$normal"
prompt_prompt="$blue\$$normal"

PLAIN_PROMPT='[\u@\h][\w](\j)\n\$ '
FANCY_PROMPT="$prompt_open$prompt_time$prompt_close_open$prompt_username$prompt_at$prompt_hostname$prompt_close_open$prompt_pwd$prompt_close$prompt_prompt "
export PS1=$FANCY_PROMPT

alias sudo="sudo -E "
alias ffs="sudo -E !!"

PATH=$PATH:$HOME/bin
PATH=$PATH:/usr/sbin:/sbin:/bin
export PATH

TERM=xterm
export TERM
