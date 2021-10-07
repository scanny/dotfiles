#
# .zshenv
#
# Runs after:
#
# * /etc/zshenv
#
# and before
#
# * /etc/zprofile
# * ~/.zprofile
# * /etc/zshrc
# * ~/.zshrc
#
# Takes care of setup required by any shell, interacive or not (scripts run in a
# non-interactive shell).
#

source ~/.zsh/checks.zsh
source ~/.zsh/path.zsh
source ~/.zsh/aliases.zsh

export LAUNCH_DB=0

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi
