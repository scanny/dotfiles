#
# .zsh/path.zsh
#
# Set the path used for shell environments
#

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
