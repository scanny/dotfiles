function precmd {
  # vcs_info
  # Put the string "hostname::/full/directory/path" in the title bar:
  echo -ne "\e]2;$PWD\a"

  # Put the parentdir/currentdir in the tab
  echo -ne "\e]1;$PWD:h:t/$PWD:t\a"

  # place a blank line above the prompt for readability
  print
}

# # this causes history to print out on every command in Cygwin, and, I'm not
# # even sure what it does, I think it's trying to put the last command into
# # the window title, which I don't really care about.
# function set_running_app {
#   printf "\e]1; $PWD:t:$(history $HISTCMD | cut -b7- ) \a"
# }

# function preexec {
#   set_running_app
# }

# function postexec {
#   set_running_app
# }
