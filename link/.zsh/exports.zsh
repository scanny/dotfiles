
# --------------------------------------------------------------------
# workaround for clang compiler difficulty
# https://langui.sh/2014/03/10/wunused-command-line-argument-hard-error-in-future-is-a-harsh-mistress/
# --------------------------------------------------------------------

export ARCHFLAGS="-Wno-error=unused-command-line-argument-hard-error-in-future"

# needed by DocBook for something
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"


# --------------------------------------------------------------------
# not PATH but path-ish interactive exports
# --------------------------------------------------------------------

# where zsh finds functions and completions
fpath=(~/.zsh $fpath)

# CDPATH allows quick directory changes
export CDPATH=~/Dropbox:~/Dropbox/src


# --------------------------------------------------------------------
# terminal
# --------------------------------------------------------------------
# Setup terminal, and turn on colors
# --- some say this should be the terminal (iTerm2) that does this. That makes some
# --- sense because Linux could use a different terminal.
# export TERM=xterm-256color

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

export EDITOR='nvim'
export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export VISUAL='nvim'

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C


# --------------------------------------------------------------------
# pip configuration
# --------------------------------------------------------------------

export PIP_REQUIRE_VIRTUALENV=true

function gpip {
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}


# --------------------------------------------------------------------
# virtualenvwrapper configuration
# --------------------------------------------------------------------

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Dropbox/src
source virtualenvwrapper.sh

export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export PIP_REQUIRE_VIRTUALENV=true
export VIRTUAL_ENV_DISABLE_PROMPT=1


# --------------------------------------------------------------------
# base16-shell configuration
# --------------------------------------------------------------------

# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"


# --------------------------------------------------------------------
# AWS configuration selection
# --------------------------------------------------------------------
# Wouldn't strictly be required but allows for multiple named AWS profile and for
# whatever reason, Sense uses a named profile, not the [default] one.
export AWS_PROFILE=sense
