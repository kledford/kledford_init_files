# zsh init file
#
# Much if this came from other places, and
# some of it is kind of Frankensteined. Ah
# well, it works :)
#
# For more info on zsh:  http://www.zsh.org

#taken from dnarayan@depot
KEYCHAIN=`which keychain`   # Keychain SSH agent forwarding program
#SSH_KEYS=(${HOME}/.ssh/id_dsa ${HOME}/.ssh/n2admin2 ${HOME}/.ssh/opsadmin)   # SSH Private Keys
SSH_KEYS=(${HOME}/.ssh/id_dsa ${HOME}/.ssh/opsadmin_dsa)   # SSH Private Keys

# Keychain initialization
if [ -f "${KEYCHAIN}" ]; then
    for key in ${SSH_KEYS}; do
        if [ -f "${key}" ]; then
            ${KEYCHAIN} --nogui -q $key
            source ${HOME}/.keychain/${HOST}-sh > /dev/null
        fi
    done
fi

#END taken from dnarayan@depot

# autoloads 
autoload -U compinit
#compinit
compinit -d ~/.zcompdump_$ZSH_VERSION

#autoload -U promptinit
# promptinit
# prompt adam1

# Environment variables

# Do things like this... 
export CVSROOT=':ext:kledford@cvs.cc.uga.edu:/usr/local/cvsroot'
# export CVSROOT=':ext:kledford@cvs:/usr/local/cvsroot'
export CVS_RSH='/usr/bin/ssh'
# export PATH=$PATH:/sbin:/usr/sbin:$HOME/bin:/opt/oracle/OraHome1/bin
export PATH=$PATH:/var/lib/gems/1.8/bin

# Prompts
#set PROMPT_SUBST
#export PS1="[%n@%m %~]%% "
export RPS1="%(t.Ding!.%D{%L:%M})"
export PS2="# "
export PRINTER=Laserjet

# from Mark Plaskin via UGALINUX
# Colors in man pages and such
export LESS_TERMCAP_mb=$'\E[00;31m'
export LESS_TERMCAP_md=$'\E[00;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[00;32m'

###TTV settings
export ZSH_HOSTS=${HOME}/.zsh/ttv_hosts
export ADHOST=atl-dc1
export ADUSER=kledford
export RUBYOPT=rubygems



###########Oracle Environment settings##########################
# ORACLE_BASE=/opt/oracle
# ORACLE_HOME=/opt/oracle/OraHome1
# ORACLE_SID=reporter
# TWO_TASK=reporter
# export ORACLE_BASE ORACLE_HOME ORACLE_SID TWO_TASK

# Hosts to use for completion - use hosts from both /etc/hosts and DNS
hosts=(`grep '^[0-9]' /etc/hosts | awk '{print $2}' | xargs` `grep "^Host" ~/.ssh/config |cut -f 2 -d" " |grep -v "*"|xargs` ${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\ *}%%,*})
#hosts=(`(${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\ *}%%,*})`)

#secure2hosts=(nms01-adl-canton-ga nms01-cha-madison-wi)
#zstyle '*' secure2hosts $secure2hosts

if [ -f ${ZSH_HOSTS} ]; then
#    hosts=($hosts `cat ${HOME}/.zsh/n2bb_hosts | xargs`)
    hosts=($hosts `cat ${ZSH_HOSTS} | xargs`)
fi
# if [[ -e ~/.ssh/known_hosts ]]; then
#     # Use .ssh/known_hosts for hostnames.
#     hosts=( ${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\ *}%%,*} `grep '^[0-9]' /etc/hosts | awk '{print $2}' | xargs`)
#     zstyle ':completion:*:hosts' hosts $hosts 
# fi


#zstyle '*' hosts $hosts
zstyle ':completion:*:hosts' hosts $hosts 

# Aliases
alias d="find . -maxdepth 1 -type d|columnize"
alias ls='ls -aFv --color'
alias ftp='ncftp'
alias l='ls -l'
alias la='ls -a'
alias cls='clear;ls'
alias die='exit'
alias pico='pico -w -z'
alias fm='frm -s new'
alias pa='ps aux'
alias 2X='startx -- :1 vt8'
alias getlatest="cvs export -D 'today'"
alias fetch='/usr/bin/fetchmail -d 300'
alias grep='grep --color=always'
alias perltrace='perl -MDevel::SimpleTrace'
alias sortip='sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4'

if [ ${HOST} = 'atl-kledford-desktop' ]; then
    alias WorkMutt="Eterm -T \"Work Mutt\" -e mutt -F ~/.mutt/.muttrc-ericsson &"
    alias goodxterm="xterm -T mutt -bg black -fg white -fn lucidasanstypewriter-18"
    alias terminalserver="rdesktop -5 -K -g 1024x768 -d us -n atl-kledford -u kledford n2-atl-nocts.us.tandbergtv.com 2>/dev/null &"
    alias adminterminalserver="rdesktop -g 1280x1024 -n n2-atl-nocts -u Administrator n2-atl-nocts  &"
    alias procmaillog='tail -f ~/Mail/.maillog |colorize'
    alias tailmaillogs='tail -f ~/Mail/.maillog /var/log/mail | colorize &'
    alias sqlquery="psql -e dcl -h n2-atl-nocdb -U postgres -c '$@;'"
    alias svn_addid='svn propset svn:keywords "Id"'
    alias svn_x_bit='svn propset svn:executable ON'
    alias sysmon02='ssh nms-sysmon02-atl-ga'
    alias omnibus='ssh netcool-omnibus01-atl-ga'
fi


# history settings
HISTFILE=~/.zsh_history/history
HISTSIZE=10000
SAVEHIST=10000

# Other misc settings
LISTMAX=0

# export PGHOST=atl-linux2
# export PGUSER=postgres
# export PGDATABASE=template1
export EDITOR="emacs"

# Expansion options
zstyle ':completion:*' completer _complete _prefix
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:predict:*' completer _complete

# Completion caching
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Expand partial paths
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-slashes 'yes'

# Include non-hidden directories in globbed file completions
# for certain commands

zstyle ':completion::complete:*' '\'

#  tag-order 'globbed-files directories' all-files 
zstyle ':completion::complete:*:tar:directories' file-patterns '*~.*(-/)'

# Don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

# Separate matches into groups
zstyle ':completion:*:matches' group 'yes'

# Describe each match group.
zstyle ':completion:*:descriptions' format "%B---- %d%b"

# Messages/warnings format
zstyle ':completion:*:messages' format '%B%U---- %d%u%b' 
zstyle ':completion:*:warnings' format '%B%U---- no match for: %d%u%b'
 
# Describe options in full
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

# }}}
# {{{ Simulate my old dabbrev-expand 3.0.5 patch 

zstyle ':completion:*:history-words' stop verbose
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*' verbose yes

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# zsh Options

setopt                       \
     NO_all_export           \
        always_last_prompt   \
     NO_always_to_end        \
        append_history       \
        auto_cd              \
        auto_list            \
        auto_menu            \
     NO_auto_name_dirs       \
        auto_param_keys      \
        auto_param_slash     \
        auto_pushd           \
        auto_remove_slash    \
     NO_auto_resume          \
        bad_pattern          \
        bang_hist            \
     NO_beep                 \
        brace_ccl            \
        correct_all          \
     NO_bsd_echo             \
        cdable_vars          \
     NO_chase_links          \
        clobber              \
        complete_aliases     \
        complete_in_word     \
        correct              \
     NO_correct_all          \
        csh_junkie_history   \
     NO_csh_junkie_loops     \
     NO_csh_junkie_quotes    \
     NO_csh_null_glob        \
        equals               \
        extended_glob        \
        extended_history     \
        function_argzero     \
        glob                 \
     NO_glob_assign          \
        glob_complete        \
     NO_glob_dots            \
        glob_subst           \
        hash_cmds            \
        hash_dirs            \
        hash_list_all        \
        hist_allow_clobber   \
        hist_beep            \
        hist_ignore_dups     \
        hist_ignore_space    \
        hist_save_no_dups    \
     NO_hist_no_store        \
        hist_verify          \
     NO_hup                  \
     NO_ignore_braces        \
     NO_ignore_eof           \
        interactive_comments \
	inc_append_history   \
     NO_list_ambiguous       \
     NO_list_beep            \
        list_types           \
        long_list_jobs       \
        magic_equal_subst    \
     NO_mail_warning         \
     NO_mark_dirs            \
     NO_menu_complete        \
        multios              \
        nomatch              \
        notify               \
     NO_null_glob            \
        numeric_glob_sort    \
     NO_overstrike           \
        path_dirs            \
        posix_builtins       \
     NO_print_exit_value     \
     NO_prompt_cr            \
        prompt_subst         \
        pushd_ignore_dups    \
     NO_pushd_minus          \
        pushd_silent         \
        pushd_to_home        \
        rc_expand_param      \
     NO_rc_quotes            \
     NO_rm_star_silent       \
     NO_sh_file_expansion    \
        sh_option_letters    \
        short_loops          \
     NO_sh_word_split        \
     NO_single_line_zle      \
        sun_keyboard_hack    \
        unset                \
     NO_verbose              \
        zle


 glob_scp() {
   emulate -L zsh
   local -a args
   local a
   for a
   do
     if [[ $a = *:* ]]
     then
       args=( $args $a )       # args+=($a) if you have zsh 4.2+
     else
       args=( $args $~a )      # args+=($~a)
     fi
   done
   scp $args
 }
 alias scp='noglob glob_scp'



# # added 4/25/2005 for local nco binary
# export NCLICENSE=/opt/netcool/omnibus/common/license
# export NETCOOL_LICENSE_FILE=27000@nms-ed-omnibus
# PATH=$PATH:/opt/netcool/omnibus/bin

#function lsnew () {
#    if [[ $1 = "" ]]; then
#        lsnew_glob="*"
#    else
#        lsnew_glob=$1
#    fi
#    ls -tr -dl $~lsnew_glob(om[1,30])
#}
#alias lsnew='noglob lsnew'


function mcd () {
    mkdir -p $1
    cd $1
}

function cdsvn () {
 cd ~/src/svn/depot/repos/$1
}

function cdcvs () {
 cd ~/src/cvs_working_dir/$1
}

function rping () {
    ping $1  |perl -n -e 'print  " " x rand(5), $_'
}

# function query_ad () {
#     perl ~/bin/new_ldap.pl --basedn=dc=tandbergtv,dc=com --hostname=atl-dc1-corp.tandbergtv.com --askfor=$1
# }

# function account_expire () {
#     perl  ~/svn/depot/repos/ops-dev/ad/adpass --hostname=atl-dc1  --username=kledford $1
# }

function edit() {
    local FILE=$1
    
    if [[ -z $FILE ]]; then
	echo "Missing filename"
	return
    fi
    
    if [ $FILE[0] != "/" -o $FILE[0] = "~" ]
	then
	FILE="$PWD/$FILE"
    fi
    
    if [[ -z $2 ]]; then
	emacsclient -n $FILE
    else
	emacsclient -e "(find-file-other-frame \"$FILE\")"
    fi
}

edit_new_frame() {
    edit $1 "yes"
}

function ghost() {
    local STRING=$1
    local CUT=$2

    if [[ -n ${CUT} ]]; then
	host -l support.tandbergtv.com | \grep -- ${STRING} | sort
    elif [[ -n ${STRING} ]]; then
	host -l support.tandbergtv.com | cut -f 1 -d"." | \grep -- ${STRING} | sort
    else
	host -l support.tandbergtv.com | sort 
    fi

}

function ghostc() {
    local STRING=$1

    if [[ -n ${STRING} ]]; then
	host -l support.tandbergtv.com | sort | \grep -- ${STRING} | cut -f 1 -d"."
    else
	host -l support.tandbergtv.com | sort 
    fi

}

# for rvm
if [[ -s /home/kledford/.rvm/scripts/rvm ]] ; then source /home/kledford/.rvm/scripts/rvm ; fi


autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"
#RPS1="$PR_RED(%D{%m-%d %H:%M})$PR_NO_COLOR"
RPS1="$PR_LIGHT_YELLOW(%D{%m-%d %H:%M})$PR_NO_COLOR"

# GIT PROMPT (http://gist.github.com/120804)
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \(\1\)/';
}

function parse_git_status {
    git status 2> /dev/null | sed -e '/(working directory clean)$/!d' | wc -l;
}

function parse_svn_status {
    svn status 2> /dev/null | wc -l;
}

function check_git_changes {
 # tput setaf 1 = RED, tput setaf 2 = GREEN
    [ `parse_git_status` -ne 1 ] && tput setaf 1 || tput setaf 2
}

function check_svn_changes {
 # tput setaf 1 = RED, tput setaf 2 = GREEN
    [ `parse_svn_status` -ne 0 ] && tput setaf 1 || tput setaf 2
}

function parse_svn_repos {
    svn info 2>/dev/null| grep URL | cut -f 5- -d"/"| sed -e 's/\(.*\)/\(\1\)/'
}

if [[ ${HOST} = 'atl-kledford-desktop' ]]; then
    PROMPT="$PR_LIGHT_BLUE%n$PR_LIGHT_RED@$PR_LIGHT_BLUE%m$PR_LIGHT_CYAN %2~ \$(check_svn_changes)\$(parse_svn_repos)\$(check_git_changes)\$(parse_git_branch)$PR_CYAN  $PR_LIGHT_WHITE 
$PR_NO_COLOR$ "
else
    PROMPT="$PR_LIGHT_BLUE%n$PR_LIGHT_RED@$PR_LIGHT_MAGENTA%m$PR_LIGHT_CYAN %2~ \$(check_svn_changes)\$(parse_svn_repos)\$(check_git_changes)\$(parse_git_branch)$PR_CYAN  $PR_LIGHT_WHITE 
$PR_NO_COLOR$ "
fi