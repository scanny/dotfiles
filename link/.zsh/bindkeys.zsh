# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

# Default to Vim bindings, regardless of editor string
bindkey -v

bindkey "^A"   beginning-of-line                    # ctrl-a  
bindkey "^B"   backward-char                        # ctrl-b
bindkey "^E"   end-of-line                          # ctrl-e
bindkey "^F"   forward-char                         # ctrl-f
bindkey "^D"   delete-char                          # ctrl-d
bindkey "^K"   kill-whole-line                      # ctrl-k
bindkey "^N"   down-line-or-search                  # ctrl-n
bindkey "^P"   up-line-or-search                    # ctrl-p
bindkey "^R"   history-incremental-search-backward  # ctrl-r
bindkey "^[[B" history-search-forward               # down arrow
bindkey "^[[A" history-search-backward              # up arrow

# vim-style command-line
bindkey -M viins 'jk' vi-cmd-mode

zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        echo -ne "\e]50;CursorShape=0\a"  # block cursor
    else
        echo -ne "\e]50;CursorShape=1\a"  # vertical bar
    fi
}
zle -N zle-keymap-select
zle-line-init () {
    zle -K viins
    echo -ne "\e]50;CursorShape=1\a"  # vertical bar
}
zle -N zle-line-init


# enable Ctrl-x-e to edit command line ---------------------

autoload -U edit-command-line
zle -N edit-command-line
# Emacs style
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
# Vi style:
bindkey -M vicmd v edit-command-line
