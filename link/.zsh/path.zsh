#
# .zsh/path.zsh
#
# Set the path used for shell environments
#
# Called by .zshenv, then again by .zprofile for interactive login shell

# This is the OS X PATH ------------------------------------
if is_mac; then
    # --- most of PATH is set by /etc/zprofile, but we need our own order ---
    PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    PATH="/opt/X11/bin:$PATH"
    PATH="/usr/local/opt/python/libexec/bin:$PATH"
    export PATH
fi

# Linux PATH, maybe ok as is -------------------------------
if is_linux; then
fi

# include user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH=${HOME}/bin:${PATH}
fi
