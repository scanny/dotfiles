# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

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

# Default to standard emacs bindings, regardless of editor string
bindkey -e
