"
" Vim filetype plugin overrides for XML
"

" re-format XML files with `xmllint`
setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
