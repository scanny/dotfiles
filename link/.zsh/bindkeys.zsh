# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

# Default to Vim bindings, regardless of editor string
bindkey -v

bindkey "^A"   beginning-of-line                    # ctrl-a
bindkey "^B"   backward-char                        # ctrl-b
bindkey "^E"   end-of-line                          # ctrl-e
bindkey "^D"   delete-char                          # ctrl-d
bindkey "^K"   kill-line                            # ctrl-k
bindkey "^N"   down-line-or-search                  # ctrl-n
bindkey "^P"   up-line-or-search                    # ctrl-p
bindkey "^R"   history-incremental-search-backward  # ctrl-r
bindkey "^[[B" history-search-forward               # down arrow
bindkey "^[[A" history-search-backward              # up arrow

# vim-style command-line
bindkey -M viins 'jk' vi-cmd-mode

# --- called each time the key-map changes, like from vicmd to viins ---
zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        printf "\e[1 q"  # --- blinking block cursor ---
    else
        printf "\e[5 q"  # --- blinking vert bar ---
    fi
}
# --- define this "New" user-defined widget ---
zle -N zle-keymap-select

# --- called each time a new command-prompt appears -defined widget ---
zle-line-init () {
    zle -K viins
}
zle -N zle-line-init


# enable Ctrl-x-e to edit command line ---------------------

autoload -U edit-command-line
zle -N edit-command-line
# Emacs style
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
# Vi style:
bindkey "^F" edit-command-line
bindkey -M vicmd "^F" edit-command-line
bindkey -M vicmd v edit-command-line
