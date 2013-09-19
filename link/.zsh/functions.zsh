# -------------------------------------------------------------------
# spectrum() -- show available colors
# -------------------------------------------------------------------
spectrum() {
    echo "${fg[black]}BLACK${reset_color}               PR_BLACK"
    echo "${fg[red]}RED${reset_color}                   PR_RED"
    echo "${fg[green]}GREEN${reset_color}               PR_GREEN"
    echo "${fg[yellow]}YELLOW${reset_color}             PR_YELLOW"
    echo "${fg[blue]}BLUE${reset_color}                 PR_BLUE"
    echo "${fg[magenta]}MAGENTA${reset_color}           PR_MAGENTA"
    echo "${fg[cyan]}CYAN${reset_color}                 PR_CYAN"
    echo "${fg[white]}WHITE${reset_color}               PR_WHITE"
    echo "${fg_bold[black]}BOLD BLACK${reset_color}     PR_BOLD_BLACK"
    echo "${fg_bold[red]}BOLD RED${reset_color}         PR_BOLD_RED"
    echo "${fg_bold[green]}BOLD GREEN${reset_color}     PR_BOLD_GREEN"
    echo "${fg_bold[yellow]}BOLD YELLOW${reset_color}   PR_BOLD_YELLOW"
    echo "${fg_bold[blue]}BOLD BLUE${reset_color}       PR_BOLD_BLUE"
    echo "${fg_bold[magenta]}BOLD MAGENTA${reset_color} PR_BOLD_MAGENTA"
    echo "${fg_bold[cyan]}BOLD CYAN${reset_color}       PR_BOLD_CYAN"
    echo "${fg_bold[white]}BOLD WHITE${reset_color}     PR_BOLD_WHITE"
}


# -------------------------------------------------------------------
# compressed file expander 
# (from https://github.com/myfreeweb/zshuery/blob/master/zshuery.sh)
# -------------------------------------------------------------------
ex() {
    if [[ -f $1 ]]; then
        case $1 in
            *.tar.bz2)  tar xvjf $1;;
            *.tar.gz)   tar xvzf $1;;
            *.tar.xz)   tar xvJf $1;;
            *.tar.lzma) tar --lzma xvf $1;;
            *.bz2)      bunzip $1;;
            *.rar)      unrar $1;;
            *.gz)       gunzip $1;;
            *.tar)      tar xvf $1;;
            *.tbz2)     tar xvjf $1;;
            *.tgz)      tar xvzf $1;;
            *.zip)      unzip $1;;
            *.Z)        uncompress $1;;
            *.7z)       7z x $1;;
            *.dmg)      hdiutul mount $1;; # mount OS X disk images
            *) echo "'$1' cannot be extracted via >ex<";;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# -------------------------------------------------------------------
# any function from http://onethingwell.org/post/14669173541/any
# search for running processes
# -------------------------------------------------------------------
any() {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any " >&2 ; return 1
    else
        ps xauwww | grep -i --color=auto "[${1[1]}]${1[2,-1]}"
    fi
}

# -------------------------------------------------------------------
# display a neatly formatted path
# -------------------------------------------------------------------
path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
}

# -------------------------------------------------------------------
# Mac specific functions
# -------------------------------------------------------------------
if is_mac; then
    # view man pages in Preview
    pman() { man $1 -t | open -f -a Preview }

    # function to show interface IP assignments
    ips() { foo=`/Users/mark/bin/getip.py; /Users/mark/bin/getip.py en0; /Users/mark/bin/getip.py en1`; echo $foo; }

    # notify function - http://hints.macworld.com/article.php?story=20120831112030251
    notify() { automator -D title=$1 -D subtitle=$2 -D message=$3 ~/Library/Workflows/DisplayNotification.wflow }
fi

# -------------------------------------------------------------------
# nice mount (http://catonmat.net/blog/another-ten-one-liners-from-commandlingfu-explained)
# displays mounted drive information in a nicely formatted manner
# -------------------------------------------------------------------
function nicemount() { (echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2="";1') | column -t ; }

# -------------------------------------------------------------------
# myIP address
# -------------------------------------------------------------------
function myip() {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
  ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# -------------------------------------------------------------------
# (s)ave or (i)nsert a directory.
# -------------------------------------------------------------------
# s() { pwd > ~/.save_dir ; }
# i() { cd "$(cat ~/.save_dir)" ; }

# -------------------------------------------------------------------
# console function
# -------------------------------------------------------------------
# function console () {
#   if [[ $# > 0 ]]; then
#     query=$(echo "$*"|tr -s ' ' '|')
#     tail -f /var/log/system.log|grep -i --color=auto -E "$query"
#   else
#     tail -f /var/log/system.log
#   fi
# }

# -------------------------------------------------------------------
# shell function to define words
# http://vikros.tumblr.com/post/23750050330/cute-little-function-time
# -------------------------------------------------------------------
givedef() {
  if [[ $# -ge 2 ]] then
    echo "givedef: too many arguments" >&2
    return 1
  else
    curl "dict://dict.org/d:$1"
  fi
}

# pg_start {
#   /usr/local/bin/pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
# }

# pg_stop {
#   /usr/local/bin/pg_ctl -D /usr/local/var/postgres stop -s -m fast
# }
