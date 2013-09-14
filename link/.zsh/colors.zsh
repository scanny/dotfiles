autoload colors; colors

# The variables are wrapped in %{%}. This should be the case for every
# variable that does not contain space.
for COLOR in BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$COLOR='%{$fg_no_bold[${(L)COLOR}]%}'
  eval PR_BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done

eval RESET='%{$reset_color%}'
export PR_BLACK PR_RED PR_GREEN PR_YELLOW PR_BLUE PR_MAGENTA PR_CYAN PR_WHITE
export PR_BOLD_BLACK PR_BOLD_RED PR_BOLD_GREEN PR_BOLD_YELLOW PR_BOLD_BLUE
export PR_BOLD_MAGENTA PR_BOLD_CYAN PR_BOLD_WHITE

# colors for 'ls -G'
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabaggxgx

# colors for 'ls --color'
if is_mac; then
    eval `gdircolors ~/.dircolors`
else
    eval `dircolors ~/.dircolors`
fi
