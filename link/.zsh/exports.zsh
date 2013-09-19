# --------------------------------------------------------------------
# paths
# --------------------------------------------------------------------

# This is the OS X PATH ------------------------------------

if is_mac; then
    # reset to known base path
    export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
    # MacPorts Installer addition on 2012-10-13_at_20:44:08
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
fi

# Cygwin PATH is different ---------------------------------

if is_cygwin; then
    PATH="/usr/local/bin:/usr/bin:/bin"
    # PATH="$PATH:/usr/sbin:/sbin:/opt/X11/bin"
    # PATH="$PATH:/home/scanny/.autojump/bin"
    # PATH="$PATH:/Windows/system32"
    # PATH="$PATH:/Windows"
    # PATH="$PATH:/Windows/System32/Wbem"
    # PATH="$PATH:/Windows/System32/WindowsPowerShell/v1.0"
    # PATH="$PATH:/Program Files/CREDANT/Shield v7.1"
    # PATH="$PATH:/Program Files (x86)/QuickTime/QTSystem"
    export PATH
fi


# include user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH=${HOME}/bin:${PATH}
fi

# where zsh finds functions and completions
fpath=(~/.zsh $fpath)

# CDPATH allows quick directory changes
CDPATH=~/Dropbox/src

# PYTHONPATH is normally not defined
# export PYTHONPATH=/usr/local/lib/python2.6/site-packages


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
if is_mac; then
    export EDITOR='mvim -v'
    export VISUAL='mvim -v'
else
    export EDITOR='vim'
    export VISUAL='vim'
fi

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C


# =========================================================================
# virtualenvwrapper configuration
# =========================================================================

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Dropbox/src
source virtualenvwrapper.sh

export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export VIRTUAL_ENV_DISABLE_PROMPT=1
