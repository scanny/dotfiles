git_prompt_info() {
  local ref=$(git symbolic-ref HEAD 2> /dev/null)
  local gitst="$(git status 2> /dev/null)"
  local pairname=${${${GIT_AUTHOR_EMAIL#pair+}%@github.com}//+/\/}
  if [[ ${pairname} == 'ch' || ${pairname} == '' ]]; then
    pairname=''
  else
    pairname=" ($pairname)"
  fi

  if [[ -f .git/MERGE_HEAD ]]; then
    if [[ ${gitst} =~ "unmerged" ]]; then
      gitstatus=" ${PR_RED}unmerged${RESET}"
    else
      gitstatus=" ${PR_GREEN}merged${RESET}"
    fi
  elif [[ ${gitst} =~ "Changes to be committed" ]]; then
    gitstatus=" ${PR_BLUE}!${RESET}"
  elif [[ ${gitst} =~ "use \"git add" ]]; then
    gitstatus=" ${PR_RED}!${RESET}"
  elif [[ -n `git checkout HEAD 2> /dev/null | grep ahead` ]]; then
    gitstatus=" ${PR_YELLOW}*${RESET}"
  else
    gitstatus=''
  fi

  if [[ -n $ref ]]; then
    echo "${PR_BOLD_GREEN}/${ref#refs/heads/}${RESET}$gitstatus$pairname"
  fi
}


# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  if [ -n "$git_where" ]; then
      local refname=${git_where#(refs/heads/|tags/)}
      local pfx="${PR_BOLD_GREEN}(${RESET}"
      local ref="${PR_BLUE}${refname}${RESET}"
      local sfx="${PR_BOLD_GREEN})${RESET}"
      echo "${pfx}${ref}${sfx}$(parse_git_state)"
      # echo "${PR_BLUE}[${ref}]$(parse_git_state)"
  fi
}


# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  git symbolic-ref -q HEAD 2> /dev/null && return
  git name-rev --name-only --no-undefined --always HEAD 2> /dev/null
}


# Show different symbols as appropriate for various Git repository states
parse_git_state() {
  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi
 
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi
 
  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi
 
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi
 
  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi
 
  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi
 
  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}


prompt_char() {
    local git_ch="${PR_BLUE}±${RESET}"
    local hg_ch="${PR_RED}☿${RESET}"
    local def_ch="${RESET}$"
    git branch >/dev/null 2>/dev/null && echo $git_ch && return
    hg root >/dev/null 2>/dev/null && echo $hg_ch && return
    echo ${def_ch}
}


# # doesn't get evaluated in prompt using "\$(smiley)" for some reason. It
# # shows up on echo $PROMPT, but always stays green
# smiley() {
#   if (( $? == 0 )); then
#     echo "${PR_CYAN}:%)${RESET}"
#   else
#     echo "${PR_RED}:(${RESET}"
#   fi
# }


virtualenv_info() {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}


# http://blog.joshdick.net/2012/12/30/my_git_prompt_for_zsh.html
# copied from https://gist.github.com/4415470
# Adapted from code found at <https://gist.github.com/1712320>.

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_PREFIX="${PR_BOLD_GREEN}[${RESET}"
GIT_PROMPT_SUFFIX="${PR_BOLD_GREEN}]${RESET}"
GIT_PROMPT_AHEAD="${PR_BOLD_GREEN}ANUM${RESET}"
GIT_PROMPT_BEHIND="${PR_CYAN}BNUM${RESET}"
GIT_PROMPT_MERGING="${PR_MAGENTA}⚡︎${RESET}"
GIT_PROMPT_UNTRACKED="${PR_RED}?${RESET}"
GIT_PROMPT_MODIFIED="${PR_RED}m${RESET}"
GIT_PROMPT_STAGED="${PR_GREEN}s${RESET}"


# export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "


RPROMPT='${PR_CYAN}!%!${RESET}'
# RPROMPT='${PR_GREEN}$(virtualenv_info)${RESET}'


# a blank line is placed above the prompt by precmd() in ./zsh_hooks.zsh
venv_pr="${PR_MAGENTA}\$(virtualenv_info)${RESET}"
time_pr="${PR_BOLD_GREEN}[%T]${RESET}"
user_pr="${PR_GREEN}%n@%m:${RESET}"
pwd_pr="${PR_YELLOW}%~%<<${RESET}"
smiley="%(?,${PR_CYAN}:%)${RESET},${PR_RED}:(${RESET})"

PROMPT="${venv_pr}${time_pr} ${user_pr} ${pwd_pr} \$(git_prompt_string)
${smiley} \$(prompt_char) "
