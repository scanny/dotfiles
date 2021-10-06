
" === terminal-related settings ====================================== {{{

" --- terminal supports true colors (24-bit RGB) ---
set termguicolors

" " --- cursor shapes and blink-rates ---
" hi! Cursor guifg=white guibg=red
" hi! Cursor2 guifg=red guibg=red
" set guicursor=a:blinkon100
" set guicursor=n-v-c:block-Cursor/lCursor,i-c-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
set guicursor=n-v-c:block,i-c-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkon100

" --- small adjustments for tmux-256color from xterm-256color ---
" --- may not be active in neovim ---
if exists('+termguicolors')
    " --- set foreground color ---
    let &t_8f = "[38;2;%lu;%lu;%lum"
    " --- set background color ---
    let &t_8b = "[48;2;%lu;%lu;%lum"
endif
" --- possible undercurl terminal codes ---
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

" }}}


" === providers ====================================================== {{{

let g:python3_host_prog = '/Users/scanny/.virtualenvs/nvim/bin/python3'
let g:ruby_host_prog = '/usr/local/lib/ruby/gems/2.7.0/bin/neovim-ruby-host'

" }}}


" === load plugins =================================================== {{{

" --- Make sure to use single quotes ---
call plug#begin(stdpath('data') . '/plugged')

" === EXPERIMENTAL ===
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
"
" --- speed-editing game ---
" Plug 'ThePrimeagen/vim-be-good'
" Plug 'tjdevries/train.nvim'
" Plug 'wellle/targets.vim'


" === MAINSTREAM ===

" --- colorschemes ---
Plug 'chriskempson/base16-vim'

" --- 'Black'-ens Python code on save ---
Plug 'psf/black', { 'branch': 'stable' }

" --- completion ---
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'

" --- snippets ---
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" --- rip-grep in Vim; multi-file search ---
Plug 'wincent/ferret'

" --- fuzzy-file finding and more ---
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" --- provides gruvbox color scheme ---
Plug 'gruvbox-community/gruvbox'

" --- lightweight status line ---
Plug 'itchyny/lightline.vim'

" --- better highlighting of search matches ---
Plug 'wincent/loupe'
" Plug 'wincent/pinnacle'  " --- for non-current match highlighting ---

" --- provides Solarized color scheme ---
Plug 'overcache/NeoSolarized'

" --- pytest run and populate quickfix ---
" Plug 'alfredodeza/pytest.vim'
Plug '5long/pytest-vim-compiler'

" --- Python syntax ---
Plug 'vim-python/python-syntax',

" --- provides quick-fix window behavior improvements ---
Plug 'yssl/QFEnter'

" --- reStructuredText support ---
Plug 'gu-fan/riv.vim'

" --- Efficient code folding for Python, which is a hard case because of sig-space ---
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold'

" --- lints on every save ---
Plug 'scrooloose/syntastic'

" --- jump around git and merge conflicts ---
Plug 'wincent/vcs-jump'

" --- more powerful camel/snake-case aware text substitution with :S instead of :s ---
Plug 'tpope/vim-abolish'

" --- improved '*' search-under-cursor behaviors ---
Plug 'haya14busa/vim-asterisk'

" --- provides filetype-aware code commenting ---
Plug 'tpope/vim-commentary'

" --- provides Cucumber language syntax and folding ---
Plug 'tpope/vim-cucumber'

" --- filesystem browser ---
Plug 'justinmk/vim-dirvish'

" --- automatically choose right asynchronous 'compiler' for make ---
Plug 'tpope/vim-dispatch'

" --- allows renames etc. on a buffer and its file ---
Plug 'tpope/vim-eunuch'

" --- git integration ---
Plug 'tpope/vim-fugitive'

" --- tag support ---
" Plug 'ludovicchabant/vim-gutentags'

" --- JSON language support ---
Plug 'elzr/vim-json'

" --- Letters instead of numbers for relative lines ---
Plug 'skamsie/vim-lineletters'

" --- store dynamically updated session files ---
Plug 'tpope/vim-obsession'

" --- better indent behavior after colon etc. on Python
Plug 'Vimjas/vim-python-pep8-indent'

" --- repeat plugin actions with '.' command ---
Plug 'tpope/vim-repeat'

" --- horizontal find with 2-letters ---
Plug 'justinmk/vim-sneak'

" --- start screen ---
Plug 'mhinz/vim-startify'

" --- write better buffer persistance (view) files ---
Plug 'zhimsel/vim-stay'

" --- enable changing surrounding pairs like quotes in single action ---
Plug 'tpope/vim-surround'

" --- test failures to quickfix window ---
" Plug 'vim-test/vim-test'

" --- handy bracket mappings like ']q' for :cnext ---
Plug 'tpope/vim-unimpaired'

" --- XML ---
Plug 'sukima/xmledit'

call plug#end()

" }}}


" === configure plugins ============================================== {{{

" --- Language Server Protocol (LSP) ---------------------------------
" lua require('lspconfig').pyls.setup{ on_attach=require'completion'.on_attach }

" set completeopt-=preview

" use omni completion provided by lsp
" autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

" --- vim-coiled-snake (Python folding) ------------------------------
" let g:coiled_snake_foldtext_flags = []
" function! g:CoiledSnakeConfigureFold(fold)
"     " --- docstrings are only folded for module-level, others open with unit ---
"     if a:fold.type == 'doc' && get(a:fold.parent, 'type', '') == 'function'
"         let a:fold.ignore = 1
"     " --- classes ---
"     elseif a:fold.type == 'class'
"         let a:fold.num_blanks_below = 1

"     " " Don't fold nested functions, but do fold methods (i.e. functions
"     " " nested inside a class).
"     elseif a:fold.type == 'function'
"         let a:fold.num_blanks_below = 0
"     endif
"         " " let a:fold.max_level = 1
"         " if get(a:fold.parent, 'type', '') == 'class'
"         "     let a:fold.num_blanks_below = 0
"         " endif
" endfunction


" " --- deoplete -------------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#enable_typeinfo = 0
" --- Tab for autocomplete ---
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" --- dirvish --------------------------------------------------------
let g:dirvish_relative_paths = 1  " --- paths relative to pwd ---


" --- FastFold -------------------------------------------------------
let g:fastfold_savehook = 1


" --- jedi-vim -------------------------------------------------------
let g:jedi#rename_command = ""
let g:jedi#usages_command = ""


" --- lightline ------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch' ], [ 'readonly', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], ['filetype'] ]
      \ },
      \ 'component': {
      \   'filetype': '%{&ft!=#""?&ft." ":"no ft"}',
      \   'lineinfo': '%-14.(ℓ %l/%L 𝚌 %-2c%)',
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'LightlineBranchName',
      \ },
      \ 'separator': {'left': "\ue0b0", 'right': "\ue0b2"},
      \ 'subseparator': {'left': ''},
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%') : '[No Name]'
  let modified = &modified ? ' ⭕️' : ''
  return filename . modified
endfunction

function! LightlineBranchName()
    if FugitiveHead() == ''
        return ' '
    endif
    return ' ' . FugitiveHead()
endfunction


" --- Loupe ----------------------------------------------------------
let g:LoupeVeryMagic = 0  " --- no automatic \v in :substitute ---


" --- python-syntax --------------------------------------------------
let g:python_highlight_all = 1
let g:python_slow_sync = 0


" --- riv ------------------------------------------------------------

" disable pesky table auto-formatting
let g:riv_auto_format_table = 0

" update folds on file save
let g:riv_fold_auto_update = 1

" show blank lines at end of fold, except the first one
let g:riv_fold_blank = 0

" turn folding on
let g:rst_fold_enabled = 1

" don't fold lists
let g:riv_fold_level = 1

" Ctrl-Q is leader for Riv commands
let g:riv_global_leader = '<C-q>'

" Let <CR> stay as :nohlsearch
let g:riv_ignored_nmaps = '<CR>'

" Avoid 'maxmempattern' error on certain lines
let g:riv_link_cursor_hl = 0


" --- SimpylFold -----------------------------------------------------
" let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
" let g:SimpylFold_fold_import = 0


" --- syntastic ------------------------------------------------------
let g:syntastic_auto_loc_list = 1
let g:syntastic_cursor_columns = 0
let g:syntastic_echo_current_error = 0
let g:syntastic_enable_baloons = 0
let g:syntastic_enable_signs = 0
let g:syntastic_mode_map = {"mode": "active", "passive_filetypes": ["rst"]}
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_rst_checkers = []


" --- UltiSnips ------------------------------------------------------
let g:UltiSnipsExpandTrigger="<C-u>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"


" " --- vim-airline ----------------------------------------------------
" " --- disable most extensions ---
" let g:airline_extensions = ["branch"]
" " --- use powerline symbols ---
" let g:airline_powerline_fonts = 1
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" " let g:airline_symbols.dirty = '🔴 ⭕️🔸🔺🔻♨️ ♦️🏮🔹✘'

" let g:airline_symbols.dirty = ' Δ'
" let g:airline_symbols.dirty = ' 💊'

" " --- don't render empty sections, like branch in non-git-repo dir ---
" let g:airline_skip_empty_sections = 1

" " Search         xxx cterm=reverse ctermfg=3 gui=reverse guifg=#b58900
" " StatusLine     xxx cterm=reverse ctermfg=10 ctermbg=7 gui=reverse guifg=#586e75 guibg=#eee8d5

" " --- don't render unnecessary default filetype 'utf-8[unix]' ---
" let g:airline#parts#ffenc#skip_expected_string  = 'utf-8[unix]'

" " --- more elegant line/column display
" " hi User1 guifg=#FF0000
" let g:airline_section_c  = "%f %{&mod?'🏮':' '}"
" let g:airline_section_c  = "%1*%f%0* %{&mod?'🏮':' '}"
" let g:airline_section_z  = "ℓ %l/%L 𝚌 %2c"


" --- vim-asterisk ---------------------------------------------------

" --- cursor does not jump to next match on '*' ---
let g:asterisk#keeppos = 1
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)


" --- Color Scheme ---------------------------------------------------

" --- normal,  high, or low ---
let g:neosolarized_contrast = "normal"
" --- brightness of whitespace characters when shown ---
let g:neosolarized_visibility = "normal"
" --- vertical split bar is transparent, 1=True, 0=False ---
let g:neosolarized_vertSplitBgTrans = 1
" --- bold, underline, and italic are enabled, 1=True, 0=False ---
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
" --- bold is displayed as brighter color ---
let g:neosolarized_termBoldAsBright = 1
" --- select NeoSolarized color scheme ---
if strftime("%H") > 7 && strftime("%H") < 19
    set background=light
else
    set background=dark
endif

" let g:gruvbox_invert_selection=0
" let g:gruvbox_italic=1
" let g:gruvbox_contrast_dark='hard'
" colorscheme gruvbox
colorscheme NeoSolarized
" let g:solarized_termcolors=256
" colorscheme solarized
" colorscheme base16-ocean
" colorscheme base16-tomorrow-night-eighties


"" vim-lineletters ------------------------------------------
" nmap <silent><Enter> <Plug>LineLetters


"" vim-json -------------------------------------------------
let g:vim_json_syntax_conceal = 0


"" XML Syntax -----------------------------------------------
let g:xml_syntax_folding=1

" }}}


" " === status line ==================================================== {{{

" " --- status line always appears (even when only one window) ---
" set laststatus=2

" " --- start from empty so don't concatenate ---
" set statusline=
" " --- branch ---
" hi User1 cterm=bold ctermfg=22 ctermbg=148 gui=bold guifg=#005f00 guibg=#afd700
" hi User2 cterm=bold ctermfg=148 ctermbg=22 gui=bold guifg=#afd700 guibg=#586e75
" set statusline+=%1*\ \ %{FugitiveHead()}
" set statusline+=\ %2*
" set statusline+=%*
" " --- path of current file ---
" " --- truncate line here (at start of path) if too long to fit ---
" set statusline+=%<
" set statusline+=\ %f
" " " --- git status indicator ---
" " set statusline+=\ %{FugitiveStatusline()}
" " --- help-buffer flag ---
" set statusline+=\ %h
" " --- modified [+] flag ---
" " hi User1 guifg=#dc322f guibg=#93a1a1
" " set statusline+=%1*%{&mod?'✘':'\ '}%*
" set statusline+=%{&mod?'🔺':'\ '}
" " --- read-only [RO] flag ---
" set statusline+=%r
" " --- separation point (left from right in this two-part case) ---
" set statusline+=%=
" " --- file-type ---
" " hi User2 gui=NONE,italic guifg=#4e4e4e guibg=#93a1a1
" " set statusline+=%2*%y\ %*
" set statusline+=%y
" " --- ruler group (ln,col,virt-col) left-justified in a 14-char field ---
" set statusline+=\ %-14.(ℓ\ %l/%L\ 𝚌\ %-2c%)

" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" " let g:airline_symbols.dirty = '🔴 ⭕️🔸🔺🔻♨️ ♦️🏮🔹✘'

" let g:airline_symbols.dirty = ' Δ'
" let g:airline_symbols.dirty = ' 💊'
" " Search         xxx cterm=reverse ctermfg=3 gui=reverse guifg=#b58900
" " StatusLine     xxx cterm=reverse ctermfg=10 ctermbg=7 gui=reverse guifg=#586e75 guibg=#eee8d5

" " --- don't render unnecessary default filetype 'utf-8[unix]' ---
" let g:airline#parts#ffenc#skip_expected_string  = 'utf-8[unix]'

" " --- more elegant line/column display
" " hi User1 guifg=#FF0000
" let g:airline_section_c  = "%f %{&mod?'🏮':' '}"
" " let g:airline_section_c  = "%1*%f%0* %{&mod?'🏮':' '}"

" set statusline=
" set statusline+=\ \ 
" set statusline+=%{FugitiveHead()}
" set statusline+=\ 

" if has('statusline')
  " set statusline=%7*                         " Switch to User7 highlight group
  " set statusline+=%{statusline#lhs()}
  " set statusline+=%*                         " Reset highlight group.
  " set statusline+=%4*                        " Switch to User4 highlight group (Powerline arrow).
  " set statusline+=                          " Powerline arrow.
  " set statusline+=%*                         " Reset highlight group.
  " set statusline+=\                          " Space.
  " set statusline+=%<                         " Truncation point, if not enough width available.
  " set statusline+=%{statusline#fileprefix()} " Relative path to file's directory.
  " set statusline+=%3*                        " Switch to User3 highlight group (bold).
  " set statusline+=%t                         " Filename.
  " set statusline+=%*                         " Reset highlight group.
  " set statusline+=\                          " Space.
  " set statusline+=%1*                        " Switch to User1 highlight group (italics).

  " Needs to be all on one line:
  "   %(                   Start item group.
  "   [                    Left bracket (literal).
  "   %R                   Read-only flag: ,RO or nothing.
  "   %{statusline#ft()}   Filetype (not using %Y because I don't want caps).
  "   %{statusline#fenc()} File-encoding if not UTF-8.
  "   ]                    Right bracket (literal).
  "   %)                   End item group.
  " set statusline+=%([%R%{statusline#ft()}%{statusline#fenc()}]%)

  " set statusline+=%*   " Reset highlight group.
  " set statusline+=%=   " Split point for left and right groups.

  " set statusline+=\               " Space.
  " set statusline+=               " Powerline arrow.
  " set statusline+=%5*             " Switch to User5 highlight group.
  " set statusline+=%{statusline#rhs()}
  " set statusline+=%*              " Reset highlight group.
" endif

" }}}


" === auto-commands ================================================== {{{

" on lose focus ------------------------ {{{
augroup on_lose_focus
    " automatically save all buffers after tabbing away from vim
    autocmd FocusLost * :silent wall
augroup END
" }}}

" restore CR in special windows -------- {{{
augroup vimrc_CRfix
  autocmd!
  " Quickfix, Location list, &c. remap <CR> to work as expected
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
  autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
augroup END
" }}}

" Cucumber file settings --------------- {{{
augroup filetype_cucumber
    autocmd!
    autocmd FileType cucumber setlocal fdm=indent sw=2
augroup END
" }}}

" gitcommit file settings -------------- {{{
augroup filetype_gitcommit
    autocmd!
    " tw - max line length before wrapping
    autocmd FileType gitcommit set colorcolumn=73 textwidth=72
    autocmd FileType gitcommit set formatoptions+=t
augroup END
" }}}

" Python file settings------------------ {{{
augroup filetype_python
    autocmd!
    " ---don't wrap Python windows---
    autocmd FileType python set fdm=expr nowrap so=3 textwidth=88
    autocmd FileType python setl so=3
    autocmd BufWritePre *.py execute ':Black'
augroup END
" }}}

" rst file settings -------------------- {{{
augroup filetype_rst
    autocmd!
    " set spell-check on
    " autocmd FileType rst setlocal spell sw=4 sts=4
    autocmd FileType rst setlocal sw=4 sts=4
augroup END
" }}}

" Vimscript file settings -------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" XML file settings -------------------- {{{
augroup filetype_xml
    autocmd!
    autocmd FileType xml setlocal fdm=syntax ts=2 sw=2 expandtab
    autocmd FileType xsd setlocal fdm=syntax ts=2 sw=2 expandtab
augroup END
" }}}

" }}}


" === set options ==================================================== {{{

" --- ar - automatically re-read an externally-changed file ---
set autoread
autocmd FocusGained * :checktime

" --- cc - place line-width indicator in column 89 (one past wrap limit)
set colorcolumn=89

" --- cul - subtly highlight cursor-line in current file ---
set cursorline

" --- et - enter spaces when tab is pressed ---
set expandtab

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
"let g:coiled_snake_set_foldtext = 0
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

" --- icm - show incremental search results in :substitute command ---
set inccommand=nosplit

" --- lcs - use the same symbols as TextMate for tabstops and EOLs ---
set listchars=tab:▸\ ,eol:¬

" --- js - inserts two spaces on join after period or ?, ! ---
set nojoinspaces

" --- enable mouse in all modes ---
set mouse=chinv

" --- mouse point changes with mode ---
set mouseshape=n:arrow,i:beam

" --- nu - set line numbering on ---
set number

" --- rnu - line numbers are relative to current line ---
set relativenumber

" --- so - minimum context lines at top/bottom on scrolling ---
set scrolloff=3

" --- sw - set width of indents/dedents ---
set shiftwidth=4

" --- shm - suppress mid-screen startup message ---
set shortmess+=I

" --- sm - briefly jump to matching bracket with bracket is inserted ---
set showmatch
" --- but don't highlight them indefinitely and obscure cursor ---
let g:loaded_matchparen = 1

" --- smd - show modellike '-- INSERT ---' at bottom ---
set noshowmode

" --- sts - set tab width for backspacing ---
set softtabstop=4

" --- sb - place new pane underneath current on horz-split ---
set splitbelow

" --- spr - place new pane to right of current on vert-split ---
set splitright

" --- sol - keep cursor in same column when paging up/down
" --- turned off so << and >> work as expected
set startofline

" --- swf - don't create a swapfile ---
set noswapfile

" --- ts - set tab width ---
set tabstop=4

" --- tw - max line length before wrapping ---
set textwidth=88

" udf - create persisted undo history
set undofile

" udir - specify directory for undo files
set undodir=~/.vim/undo

" --- ve - allow cursor to travel where there is no actual character ---
set virtualedit=block

" --- vop - view options, remove some for vim-stay plugin ---
" set viewoptions=cursor,folds,slash,unix
set viewoptions=cursor,slash,unix

" --- command-line completion ---
set wildmode=longest:full,full

" --- wh - make current window as tall as possible ---
set winheight=199

" --- wmh - minimum number of lines for non-current windows ---
set winminheight=3

" wiw - minimum number of columns for current window
set winwidth=96

" }}}


" === keyboard remappings ============================================ {{{

" --- global mappings -------------------------------------- {{{

" ---use F5 to toggle between light and dark background ---
map <F5> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>

" }}}


" --- leader commands -------------------------------------- {{{

" leader is comma
let mapleader=","

" <leader> - switch to alternate buffer
nnoremap <leader><leader> <C-^>

" b - wipe current buffer (and close window)
nnoremap <silent> <leader>b :bw<CR>

" c - close current window
nnoremap <silent> <leader>c :clo<CR>

" e - open file in same directory as current file
map <leader>e :e %%

" f - fzf file finder
map <leader>f :Files<CR>

" gd - :Gdiff
map <leader>gd :Gdiff<CR>

" gs - :Gstatus
map <leader>gs :Gstatus<CR>

" gw - :Gwrite
map <leader>gw :Gwrite<CR>

" j* - Jedi definitions
nmap <leader>jd :call jedi#goto_definitions()<CR>
nmap <leader>ju :call jedi#usages()<CR>

" l - toggle show invisibles
nnoremap <leader>l :set list!<CR>

" Enter - :noh - turn off search highlighting, but not in quickfix
" nnoremap <expr> <CR> &buftype ==# 'quickfix' ? '<CR>' : ':nohlsearch<CR>'
nmap <leader>n <Plug>(LoupeClearHighlight)

" ob - open _scratch/blank.rst in split below, stay in current window
nnoremap <leader>ob :split _scratch/blank.rst<CR><C-w>k

" od - open 'TODO.rst'
nnoremap <silent> <leader>od :vsplit _scratch/TODO.rst<CR>

" os - open spike:% in split above and place cursor there
nnoremap <leader>os :split<CR><C-w>k:Gedit spike:%<CR>

" ov - open ~/.config/nvim/init.vim file in split below current
nnoremap <leader>ov :split $MYVIMRC<CR>

" p - paste from clipboard
nnoremap <leader>p "*p

" P - paste before from clipboard
nnoremap <leader>P "*P

" q - hardwrap current paragraph (like Ctrl-Q)
nnoremap <leader>q gqip

" r - toggle relative line numbers
function! ToggleRelativeNumber()
  if (&relativenumber == 1)
    set number
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <leader>r :call ToggleRelativeNumber()<CR>

" R - run current module on ,t
function! MakeCurrentBufferRunModule()
    let l:path=expand('%')
    execute 'nnoremap <leader>t :w\|!python ' l:path "<CR>"
    echo ',t: ' . l:path
endfunc
nnoremap <silent> <leader>R :call MakeCurrentBufferRunModule()<CR>

" sp - open horizontal split window
nnoremap <leader>sp :split<CR>

" ss - reSync syntax from Start
nnoremap <leader>ss :syntax sync fromstart<CR>

" sv - source ~/.vimrc (after changes)
nnoremap <leader>sv :source $MYVIMRC<CR>

" t - test
nnoremap <leader>t :w\|!py.test -x<CR>

" T - set current (test) module to run on ,t
function! MakeCurrentBufferTestModule()
    let l:path=expand('%')
    execute 'nnoremap <leader>t :w\|!py.test -x -s -q --tb=native ' l:path "<CR>"
    echo ',t: ' . l:path
endfunc
nnoremap <silent> <leader>T :call MakeCurrentBufferTestModule()<CR>

" v - vertical split
map <leader>v :vsplit<CR>

" w - write current buffer
nnoremap <leader>w :write<CR>

" x - cut to system pasteboard (for cut/paste)
vnoremap <leader>x "*x

" y - yank to system pasteboard ('copy' for copy/paste)
vnoremap <leader>y "*y

" z - suspend to shell prompt
nnoremap <leader>z <C-Z>

" }}}


" --- insert mode ------------------------------------------ {{{

" jk instead of Esc
inoremap jk <Esc>
inoremap JK <Esc>

" Ctrl-k is kill (to end of line) in insert mode. Note this overrides insert di-graph
" which is Vim built-in mapping of insert-mode Ctrl-k.
inoremap <C-k> <C-\><C-O>D

" }}}


" --- normal mode ------------------------------------------ {{{

" Enter - :nohlsearch - turn off search highlighting
" nnoremap <CR> :nohlsearch<CR>
nmap <CR> <Plug>(LoupeClearHighlight)

" space - toggle fold
nnoremap <space> za

" --- reselect pasted text ---
nnoremap gp `[v`]

" --- gs - move to first non-blank on line ---
nnoremap gs ^

" --- always screen lines for up and down motion ---
nnoremap <silent> j gj
nnoremap <silent> k gk

" --- Q - exit quickly when multiple windows are open (like quick-fix pane) ---
nnoremap Q :qa<CR>

" --- Y - yanks to end of line (instead of entire line, like yy)
nnoremap Y y$

" --- zx - refold around current and center in vertical space ---
nnoremap zx zxzz

" --- Ctrl+{movement} keys navigate between windows ---
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" }}}


" --- command mode ----------------------------------------- {{{

" %% expands to directory of current buffer
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" get prior (and next) command that starts-with current string
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" }}}


" --- visual mode ------------------------------------------ {{{

" --- search defaults to very-magic mode ---
vnoremap / /\v

" }}}

" }}}
