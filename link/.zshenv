#
# .zshenv
#

source ~/.zsh/checks.zsh
source ~/.zsh/path.zsh
source ~/.zsh/aliases.zsh

export LAUNCH_DB=0

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi
