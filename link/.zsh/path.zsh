#
# .zsh/path.zsh
#
# Set the path used for shell environments
#

# This is the OS X PATH ------------------------------------
if is_mac; then
    # reset to known base path
    export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
fi

# Cygwin PATH is different ---------------------------------
if is_cygwin; then
    PATH="/usr/local/bin:/usr/bin:/bin"
    # PATH="$PATH:/usr/sbin:/sbin:/opt/X11/bin"
    # PATH="$PATH:/Windows/system32"
    # PATH="$PATH:/Windows"
    # PATH="$PATH:/Windows/System32/Wbem"
    # PATH="$PATH:/Windows/System32/WindowsPowerShell/v1.0"
    export PATH
fi

# Linux PATH, maybe ok as is -------------------------------
if is_linux; then
fi

# include user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH=${HOME}/bin:${PATH}
fi
