#
# aliases.zsh
#

# platform-specific aliases --------------------------------
if is_mac; then
    # set iTerm2 cursor back to vertical bar
    alias curs='echo -e -n "\033]50;CursorShape=1\007"'
    alias e='mvim -S Session.vim'
    alias l='/usr/local/bin/gls -la --color --group-directories-first'
    alias lh='/usr/local/bin/gls -dl --color --group-directories-first .*'
    alias ll='/usr/local/bin/gls -l --color --group-directories-first'
    alias lla='/usr/local/bin/gls -la --color --group-directories-first'
    alias vim='mvim -v'
else
    alias e='vim -S Session.vim'
    alias l='ls -la --color --group-directories-first'
    alias lh='ls -dl --color --group-directories-first .*'
    alias ll='ls -l --color --group-directories-first'
    alias lla='ls -la --color --group-directories-first'
fi

# ----------------------------------------------------------

alias b='behave'


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
# git aliases
# ---------------------------------------------------------
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gai='git add --interactive'

alias gb='git branch'
alias gba='git branch -a'

alias gc='git commit -v'
alias gca='git commit -v --amend'
alias gcar='git commit --amend --reuse-message=HEAD'
alias gcl='git config --list'
alias gclean='git reset --hard && git clean -dfx'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcod='git checkout develop'
alias gcof='git checkout fixit'
alias gcom='git checkout master'
alias gcos='git checkout spike'
alias gcow='git checkout working'
alias gcp='git cherry-pick'
alias gcpc='git cherry-pick --continue'

alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'

alias gf='git fetch'

alias gh='git h'
alias ghp='git hp'

alias gl='git l'
alias gla='git la'
alias glr='git r'
alias glra='git ra'
alias gls='git --no-pager log --oneline -S'
alias glsf='git ls-files | grep'

alias gm='git merge'

alias gn='git n'

alias gp='git log -p -1 --oneline HEAD'

alias gr='git remote'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbfd='git rebase fixit develop'
alias grbi='git rebase -i'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'
alias grsh='git reset --hard'
alias grsH='git reset HEAD'
alias grsHh='git reset HEAD --hard'
alias grv='git remote -v'

alias gs='git status'
alias gss='git status -s'

alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

alias gx='gitx --all'

# -------------------------------------------------------------------

alias gentags='ctags .'
# alias history='fc -l 1'
alias n='next'
alias oz="vim ~/.zshrc"
alias p='prev'
alias po='popd'
alias pt='py.test'
alias pu='pushd'
alias rm='rm -i'
alias sz="source ~/.zshrc"
alias t='make clean && flake8 && py.test && behave --stop'
alias tw='make clean && flake8 && py.test && behave --stop --tags=-wip'
alias view='mvim -Rv'

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
