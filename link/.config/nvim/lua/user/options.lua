local set = vim.opt

-- terminal-related settings ----------------------------------------------- {{{

-- cc - place line-width indicator in column 89 (one past wrap limit)
set.colorcolumn = "89"

-- cul - subtly highlight cursor-line in current file ---
set.cursorline = true

-- et - enter spaces when tab is pressed ---
set.expandtab = true

-- fdm - specify method used for computing folds ---
set.foldmethod = "expr"

-- fde - specify expression used for computing folds ---
set.foldexpr = "nvim_treesitter#foldexpr()"

-- fdn - specify number of fold levels (might customize by filetype) ---
set.foldnestmax = 2

-- cursor shapes and blink-rates ---
set.guicursor = "n-v-c:block,i-c-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkon100"

-- icm - show incremental search results in :substitute command ---
set.inccommand = "nosplit"

-- lcs - use the same symbols as TextMate for tabstops and EOLs ---
set.listchars = "tab:▸ ,eol:¬"

-- js - inserts two spaces on join after period or ?, ! ---
set.joinspaces = false

-- enable mouse in all modes ---
set.mouse = "chinv"

-- mouse point changes with mode ---
set.mouseshape = "n:arrow,i:beam"

-- nu - set line numbering on ---
set.number = true

-- rnu - line numbers are relative to current line ---
set.relativenumber = false

-- so - minimum context lines at top/bottom on scrolling ---
set.scrolloff = 3

-- ssop - change effect of :mksession command ---
set.sessionoptions:append "tabpages,globals"

-- sw - set width of indents/dedents ---
set.shiftwidth = 4

-- shm - suppress mid-screen startup message ---
set.shortmess:append "I"

-- smd - show modellike '-- INSERT ---' at bottom ---
set.showmode = false

-- sts - set tab width for backspacing ---
set.softtabstop = 4

-- sb - place new pane underneath current on horz-split ---
set.splitbelow = true

-- spr - place new pane to right of current on vert-split ---
set.splitright = true

-- sol - keep cursor in same column when paging up/down
-- turned off so << and >> work as expected
set.startofline = true

-- swf - don't create a swapfile ---
set.swapfile = false

-- ts - set tab width ---
set.tabstop = 4

-- terminal supports true colors (24-bit RGB) ---
set.termguicolors = true

-- tw - max line length before wrapping ---
set.textwidth = 88

-- udf - create persisted undo history ---
set.undofile = true

-- udir - specify directory for undo files ---
set.undodir = "~/.vim/undo"

-- ve - allow cursor to travel where there is no actual character ---
set.virtualedit = "block"

-- vop - view options, remove some for vim-stay plugin ---
-- set.viewoptions = "cursor,folds,slash,unix"
set.viewoptions = "cursor,slash,unix"

-- command-line completion ---
set.wildmode = "longest:full,full"

-- wh - make current window as tall as possible ---
set.winheight = 199

-- wmh - minimum number of lines for non-current windows ---
set.winminheight = 3

-- wiw - minimum number of columns for current window ---
set.winwidth = 96

-- }}}


vim.cmd([[

" --- ar - automatically re-read an externally-changed file ---
set autoread
autocmd FocusGained * :checktime

" --- fcs - characters used for folds, window dividers, etc. ---
let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'
""" Override default `foldtext()`, which produces something like:
"""
"""   +---  2 lines: source $HOME/.vim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim--------------------------------
"""
""" Instead returning:
"""
"""   »··[2ℓ]··: source $HOME/.vim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim···································
"""
function! MyFoldText() abort
  " let l:lines='[' . printf('[%3d](v:foldend - v:foldstart + 1)) . s:small_l . ']'
  let l:lines=printf('[%3d%s]', (v:foldend - v:foldstart + 1), s:small_l)
  let l:first=substitute(getline(v:foldstart), '\v *', '', '')
  let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
  return s:raquo . s:middot . s:middot . l:lines . l:dashes . ': ' . l:first
endfunction

set fillchars=vert:┃   " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
set fillchars+=fold:·  " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
set foldtext=MyFoldText()

" --- sm - briefly jump to matching bracket with bracket is inserted ---
set showmatch
" --- but don't highlight them indefinitely and obscure cursor ---
let g:loaded_matchparen = 1

" }}}
]])
