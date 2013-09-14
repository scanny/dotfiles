# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH=${HOME}/bin:${PATH}
fi


# User specific environment and startup programs

# MacPorts Installer addition on 2012-10-13_at_20:44:08: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

if [ -f /opt/local/etc/profile.d/autojump.bash ]; then
  . /opt/local/etc/profile.d/autojump.bash
fi

export PATH="$PATH:/opt/local/lib/postgresql84/bin"

export EDITOR='mvim -f'
export JAVA_HOME=/opt/java

export PGDATABASE='ar'
export PGUSER='ar_app'

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# prompt text and colors
CYAN='\[\e[0;36m\]'
RED='\[\e[1;31m\]'
OFF='\[\e[m\]'
USERNAME='\u'
HOST='\h'
WRKGDIR='\w'
# PS1="\[\e[01;32m\]\u@\h \[\e[01;34m\]\W \`if [ \$? = 0 ]; then echo -e '\[\e[01;32m\]:)'; else echo -e '\[\e[01;31m\]:('; fi\` \[\e[01;34m\]$\[\e[00m\]"
SMILEY="\`if [ \$? = 0 ]; then echo -e '\[\e[01;32m\]:)'; else echo -e '\[\e[01;31m\]:('; fi\`${OFF}"
export PS1="\n${RED}${USERNAME}@${HOST}:${OFF}${CYAN}${WRKGDIR}${OFF} $(parse_git_branch)\n${SMILEY} $ "

