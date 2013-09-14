# ---------------------------------------------------------
# basics
# ---------------------------------------------------------

# Allow comments even in interactive shells (especially for Muness)
setopt interactive_comments

# don't beep on error
setopt no_beep


# ---------------------------------------------------------
# changing directories
# ---------------------------------------------------------

# If you type foo, and it isn't a command, and it is a directory in your
# cdpath, go there
setopt auto_cd
setopt auto_pushd

# Make cd push the old directory onto the directory stack.

# if argument to cd is the name of a parameter whose value is a valid
# directory, it will become the current directory
setopt cdablevars

# don't push multiple copies of the same directory onto the directory stack
setopt pushd_ignore_dups


# ---------------------------------------------------------
# completion
# ---------------------------------------------------------

# When completing from the middle of a word, move the cursor to the end of
# the word
setopt always_to_end

# show completion menu on successive tab press. needs unsetop menu_complete to work
setopt auto_menu

# any parameter that is set to the absolute name of a directory immediately
# becomes a name for that directory
setopt auto_name_dirs

# Allow completion from within a word/phrase
setopt complete_in_word

# do not autoselect the first completion entry
unsetopt menu_complete


# ---------------------------------------------------------
# correction
# ---------------------------------------------------------

# (don't do) spelling correction for commands
unsetopt correct

# (don't do) spelling correction for arguments
unsetopt correctall


# ---------------------------------------------------------
# expansion and globbing
# ---------------------------------------------------------

# treat #, ~, and ^ as part of patterns for filename generation
setopt extended_glob


# ---------------------------------------------------------
# history
# ---------------------------------------------------------

# Allow multiple terminal sessions to all append to one zsh command history
setopt append_history

# Include timestamp of command and duration
setopt extended_history

# when trimming history, lose oldest duplicates first
setopt hist_expire_dups_first

# When searching history don't display results already cycled through twice
setopt hist_find_no_dups

# Do not write events to history that are duplicates of previous events
setopt hist_ignore_dups

# remove command line from history list when first character on the line is a space
setopt hist_ignore_space

# Remove extra blanks from each command line being added to history
setopt hist_reduce_blanks

# don't execute, just expand history
setopt hist_verify

# Add comamnds as they are typed, don't wait until shell exit
setopt inc_append_history

# imports new commands and appends typed commands to history
setopt share_history


# ---------------------------------------------------------
# prompt
# ---------------------------------------------------------

# Enable parameter expansion, command substitution, and arithmetic expansion
# in the prompt
setopt prompt_subst

# (don't) only show the rprompt on the current prompt
unsetopt transient_rprompt


# ---------------------------------------------------------
# scripts and functions
# ---------------------------------------------------------

# perform implicit tees or cats when multiple redirections are attempted
# setopt multios
