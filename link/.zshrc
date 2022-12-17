#
# .zshrc
#
# Runs in overall sequence:
#
# 1. /etc/zshenv
# 2. ~/.zshenv
# 3. /etc/zprofile
# 4. ~/.zprofile
# 5: /etc/zshrc
#
# HERE-> 6: ~/.zshrc
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --- turned off most of the time, we either use brew-installed (system) Python version
# --- or we're in a virtualenv and use that version.
# eval "$(pyenv init -)"
