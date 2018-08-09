
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
if is_mac; then
    export CDPATH=~/Dropbox/src
else
    export CDPATH=~/src
fi


# --------------------------------------------------------------------
# terminal
# --------------------------------------------------------------------
# Setup terminal, and turn on colors
export TERM=xterm-256color

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
# if is_mac; then
#     export EDITOR='mvim -v'
#     export VISUAL='mvim -v'
# else
    export EDITOR='vim'
    export VISUAL='vim'
# fi

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C


# --------------------------------------------------------------------
# pip configuration
# --------------------------------------------------------------------

export PIP_REQUIRE_VIRTUALENV=true

gpip() {
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
export VIRTUAL_ENV_DISABLE_PROMPT=1
