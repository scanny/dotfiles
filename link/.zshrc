#
# .zshrc
#
# Runs after:
#
# * /etc/zshenv
# * ~/.zshenv
# * /etc/zprofile
# * ~/.zprofile
# * /etc/zshenv
#
# Generally takes care of setup distinctive to interacive shells.
#

# --- path is set in zshenv, which always runs so scripts have it ---
# source ~/.zsh/path.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
source ~/.zsh/zsh_hooks.zsh
