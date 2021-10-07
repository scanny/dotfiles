#
# .zshenv
#
# Runs in overall sequence:
#
# 1: /etc/zshenv
#
# HERE-> 2: ~/.zshenv
#
# 3: /etc/zprofile
# 4: ~/.zprofile
# 5: /etc/zshrc
# 6: ~/.zshrc
#
# Takes care of setup required by any shell, interacive or not (scripts run in a
# non-interactive shell).
#

source ~/.zsh/checks.zsh
# --- PATH is set here (in ~/.zsh/path.zsh), but can be clobbered by later /etc/zprofile
# --- so must be set again in ~/.zprofile
source ~/.zsh/path.zsh
source ~/.zsh/aliases.zsh

export LAUNCH_DB=0

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi
