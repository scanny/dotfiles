"
" Add or override filetype mappings for Vim
"

if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.applescript setfiletype applescript
augroup END
