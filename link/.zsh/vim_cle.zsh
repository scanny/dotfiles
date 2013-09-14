
# zle-keymap-select () {
#   case $KEYMAP in
#     vicmd) print -rn -- $terminfo[cvvis];; # block cursor
#     viins) print -rn -- $terminfo[cnorm];; # less visible cursor
#   esac
# }


# # vim command line edit mode =====================================

# vim_ins_mode="%{%K{white}%F{black}%}--INSERT--%{%f%k%b%}"
# vim_cmd_mode="%{%K{green}%F{black}%}--NORMAL--%{%f%k%b%}"
# vim_mode=$vim_ins_mode

# vim_ins_curs="\033]50;CursorShape=1\007"  # vertical bar
# vim_cmd_curs="\033]50;CursorShape=0\007"  # block cursor

# function zle-keymap-select {
#   vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
#   vim_curs="${${KEYMAP/vicmd/${vim_cmd_curs}}/(main|viins)/${vim_ins_curs}}"
#   zle reset-prompt
#   print -n ${vim_curs}
# #   case $KEYMAP in
# #     viins) print -n -- "\033]50;CursorShape=1\007";; # less visible cursor
# #     vicmd) print -n -- "\033]50;CursorShape=0\007";; # block cursor
# #   esac
# }
# zle -N zle-keymap-select

# function zle-line-finish {
#   vim_mode=$vim_ins_mode
# }
# zle -N zle-line-finish

# set -o vi
# RPROMPT='${vim_mode} %{%F{cyan}%}!%!%{%f%}'
