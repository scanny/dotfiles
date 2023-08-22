#
# aliases.zsh
#

# platform-specific aliases --------------------------------
if is_mac; then
    # set iTerm2 cursor back to vertical bar
    alias curs='echo -e -n "\033]50;CursorShape=1\007"'
    alias l='/usr/local/bin/gls -la --color --group-directories-first'
    alias lh='/usr/local/bin/gls -dl --color --group-directories-first .*'
    alias ll='/usr/local/bin/gls -l --color --group-directories-first'
    alias lla='/usr/local/bin/gls -la --color --group-directories-first'
    alias vim='nvim'
else
    alias l='ls -la --color --group-directories-first'
    alias lh='ls -dl --color --group-directories-first .*'
    alias ll='ls -l --color --group-directories-first'
    alias lla='ls -la --color --group-directories-first'
fi

# ----------------------------------------------------------

alias b='behave'
# show work-in-progress (WIP) behave scenarios
alias bw='behave --tags=wip --no-skipped --dry-run'

alias csb='clear && printf "\e[3J"'  # --- C-lear S-croll B-ack ---

# -------------------------------------------------------------------
# directory movement
# -------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias bk='cd $OLDPWD'
alias d='dirs -lpv'
alias dc='dirs -c'

# ---------------------------------------------------------
# docker aliases
# ---------------------------------------------------------
# --- list images ---
alias di=docker\ images
# --- list running containers ---
alias dps=docker\ ps
# --- list all containers, running or stopped ---
alias dpsa=docker\ ps\ -a
# --- remove docker container ---
alias drm=docker\ rm
# --- remove docker image ---
alias drmi=docker\ rmi

alias e='nvim -S'

# ---------------------------------------------------------
# git aliases
# ---------------------------------------------------------
alias ga='git add'
alias gaa='git add --all'
alias gai='git add --interactive'

alias gb='git --no-pager branch'

alias gc='git commit -v'
alias gca='git commit -v --amend'
alias gcar='git commit --amend --reuse-message=HEAD'
alias gcl='git config --list'
alias gcm='cat $(git rev-parse --show-toplevel)/.git/rebase-merge/message'
alias gco='git checkout'
alias gcof='git checkout fixit'
alias gcom='git checkout master'
alias gcoo='git checkout --ours .'
alias gcooa='git checkout --ours . && git add --all'
alias gcos='git checkout spike'
alias gcp='git cherry-pick'
alias gcpc='git cherry-pick --continue'
alias gcpnc='git cherry-pick --no-commit'

alias gd='git diff'
alias gdc='git diff --cached'

# --- git HEAD, on one line ---
alias gH='git lawg -1'

gl() { git lawg $@ | less -EFXRS }
alias gla='gl --all'
# --- git log "recent", 42 is adjustable for window size ---
alias glr='git lawg -42'
alias glra='git lawg -42 --all'
alias glrf='glr fixit'
alias glrs='glr spike'

alias gm='git merge'

alias gn='git n'

# --- show patch/diff for HEAD ---
alias gp='git log -p -1 --oneline HEAD'

alias gr='git restore'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'
alias grs='git restore --staged'
alias grsh='git reset --hard'
alias grsH='git reset HEAD'

alias gs='git status'

alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

# -------------------------------------------------------------------

alias gentags='ctags .'
# ---allow access to global Python environment---
alias gpip='PIP_REQUIRE_VIRTUALENV="" pip'
# alias history='fc -l 1'

alias n='next'
alias oz="vim ~/.zshrc"
alias p='prev'
alias po='popd'
alias pt='py.test'
alias pu='pushd'
alias rm='rm -i'
alias sz="source ~/.zshrc"
alias t='make clean && ruff . && py.test && behave --stop'
alias tw='make clean && ruff . && py.test && behave --stop --tags=-wip'
alias view='nvim -R'
# --- V-cs-jump M-erge ---
alias vm=vim\ -c\ 'VcsJump\ merge'

# -------------------------------------------------------------------
# directory information
# -------------------------------------------------------------------
# # directories sorted by size
# alias 'dus=du -sckx * | sort -nr'

# # number of files (not directories)
# alias 'filecount=find . -type f | wc -l'

# # sort files in current directory by the number of words they contain
# alias 'wordy=wc -w * | sort | tail -n10'

# -------------------------------------------------------------------
# Mac only
# -------------------------------------------------------------------
if is_mac; then
    alias ql='qlmanage -p 2>/dev/null' # OS X Quick Look
    alias oo='open .' # open current directory in OS X Finder
    alias 'today=calendar -A 0 -f /usr/share/calendar/calendar.mark | sort'
    alias 'mailsize=du -hs ~/Library/mail'
    # display SMART status of hard drive
    alias 'smart=diskutil info disk0 | grep SMART'
    # Hall of the Mountain King
    alias cello='say -v cellos "di di di di di di di di di di di di di di di di di di di di di di di di di di"'
    # # refresh brew by upgrading all outdated casks
    # alias refreshbrew='brew outdated | while read cask; do brew upgrade $cask; done'
fi

# -------------------------------------------------------------------
# Python virtualenv 
# -------------------------------------------------------------------
alias mkenv='mkvirtualenv'
alias on="workon"
alias off="deactivate"
