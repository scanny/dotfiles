" a priori items ----------------------------------------------------{{{

set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
" call vundle#rc()

au BufRead,BufNewFile *.tmpl set filetype=html

" }}}


" terminal-related settings -----------------------------------------{{{

" terminal can display 256 colors
set t_Co=256

" set cursor to block in normal mode, vert bar in insert mode

" OS X (iTerm2) version
if has("macunix")
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    " let &t_ti = "\<Esc>]50;CursorShape=0\x7"
    " let &t_te = "\<Esc>]50;CursorShape=1\x7"
endif

" Linux on iTerm2 via ssh
if has("unix")
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Cygwin version
if has("win32unix")
    " take terminal out of "termcap" mode
    let &t_te .= "\e[0 q"
    " put terminal in "termcap" mode
    let &t_ti .= "\e[1 q"
    " end insert mode
    let &t_EI .= "\e[1 q"
    " start insert mode
    let &t_SI .= "\e[5 q"
endif

" }}}


" load plugins ------------------------------------------------------{{{

call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

" other bundles installed
" Plugin 'Konfekt/FastFold'
Plugin 'Rykka/riv.vim',        {'pinned': 1}
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-abolish'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-cucumber',   {'pinned': 1}
Plugin 'tpope/vim-fugitive'
" Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-obsession'
Plugin 'hynek/vim-python-pep8-indent'
" Plugin 'tpope/vim-repeat'
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'sjl/vitality.vim'
" Plugin 'sukima/xmledit'

" skip these bundles if on Cygwin
if has("macunix")
    Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
    " Plugin 'SirVer/ultisnips'
    Plugin 'Valloric/YouCompleteMe'
endif

" " these bundles are compatible with Linux
" if has("unix")
"     Plugin 'Lokaltog/powerline'
" endif

call vundle#end()

filetype plugin indent on
syntax on

set background=dark
colorscheme solarized

" }}}


" configure plugins ------------------------------------------------- {{{

" these plugins are only installed in OS X -----------------

if has("macunix")
    " powerline
    set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
    " UltiSnips
    " let g:UltiSnipsExpandTrigger="<S-Tab>"
    " YouCompleteMe
    let g:ycm_key_list_previous_completion=['<Up>']
endif

" these plugins are installed in Linux ---------------------

if has("unix")
    " powerline
    set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
endif


" built-ins ------------------------------------------------
let loaded_matchparen = 1


" ctrlp ----------------------------------------------------
let g:ctrlp_custom_ignore = '\v[\/]\.tox$'
let g:ctrlp_show_hidden = 1


" netrw ----------------------------------------------------
let g:netrw_list_hide = '.*\.pyc$'
let g:netrw_hide = 1


" riv ------------------------------------------------------

" update folds on file save
let g:riv_fold_auto_update = 1

" show blank lines at end of fold, except the first one
let g:riv_fold_blank = 0

" don't fold lists
let g:riv_fold_level = 1

" Ctrl-Q is leader for Riv commands
let g:riv_global_leader = '<C-q>'


" SimpylFold -----------------------------------------------
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0


" solarized color scheme -----------------------------------

" invisibles (e.g. newlines)
" low: subdued, normal: gray, high: red
let g:solarized_visibility = "normal"


" syntastic ------------------------------------------------
let g:syntastic_auto_loc_list = 1
let g:syntastic_cursor_columns = 0
let g:syntastic_echo_current_error = 0
let g:syntastic_enable_baloons = 0
let g:syntastic_enable_signs = 0
let g:syntastic_filetype_map = { "tmpl": "html" }
let g:syntastic_html_tidy_ignore_errors = [
    \'discarding unexpected </label>',
    \'<form> lacks "',
    \'<form> proprietary attribute "novalidate"',
    \'<input> attribute "required/" lacks value',
    \'inserting implicit <label>',
    \'<link> escaping malformed URI reference',
    \"<link> isn't allowed in <body> elements",
    \"<meta> isn't allowed in <body> elements",
    \"missing </button>",
    \"missing </label> before <",
    \"plain text isn't allowed in <head> elements",
    \' proprietary attribute "bix',
    \' proprietary attribute "hide-events',
    \' proprietary attribute "icon',
    \' proprietary attribute "ng-',
    \' proprietary attribute "required',
    \' proprietary attribute "show-events',
    \'replacing unexpected button by </button>',
    \'trimming empty <',
    \'unescaped &',
\]
let g:syntastic_html_tidy_blocklevel_tags = [
    \'bix-template-select',
    \'phone-list',
\]
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_rst_checkers = []


" vim-commentary -------------------------------------------

" release traditional comment mappings to avoid key delay
" xunmap \\
" nunmap \\
" nunmap \\\
" nunmap \\u


" vim-python-pep8-indent -----------------------------------
let g:python_pep8_indent_multiline_string = -1


" Vitality -------------------------------------------------
let g:vitality_always_assume_iterm = 1


" XML Syntax -----------------------------------------------
let g:xml_syntax_folding=1
autocmd FileType xml setlocal foldmethod=syntax


" YouCompleteMe --------------------------------------------

let g:ycm_filetype_blacklist = {
    \ 'rst' : 1,
\}

" }}}


" auto-commands ----------------------------------------------------- {{{

" after Vim startup -------------------- {{{
augroup at_end_of_vim_setup
    " wh - minimum number of lines for current window
    " wmh - minimum number of lines for non-current windows
    autocmd!
    autocmd VimEnter set winheight=5
    autocmd VimEnter set winminheight=3
    autocmd VimEnter set winheight=41
augroup END
" }}}

" Applescript file settings ------------ {{{
augroup filetype_applescript
    autocmd!
    " comment string used by vim-commentary
    autocmd FileType applescript set commentstring=#\ %s
augroup END
" }}}

" C file settings ---**----------------- {{{
augroup filetype_c
    autocmd!
    " comment string used by vim-commentary
    autocmd FileType c set commentstring=//\ %s
    autocmd FileType c set foldmethod=syntax
    autocmd FileType c set foldnestmax=1
augroup END
" }}}

" C++ file settings -------------------- {{{
augroup filetype_cpp
    autocmd!
    " comment string used by vim-commentary
    autocmd FileType cpp set commentstring=//\ %s
    autocmd FileType cpp set foldmethod=syntax
    autocmd FileType cpp set foldnestmax=1
augroup END
" }}}

" HTML file settings ------------------- {{{
augroup filetype_html
    autocmd!
    autocmd FileType html setlocal ts=2 sw=2 expandtab
augroup END
" }}}

" Java file settings ------------------- {{{
augroup filetype_java
    autocmd!
    " tw - max line length before wrapping
    autocmd FileType java set makeprg=javac\ %
    set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
augroup END
" }}}

" gitcommit file settings ----------------- {{{
augroup filetype_gitcommit
    autocmd!
    " tw - max line length before wrapping
    autocmd FileType gitcommit set textwidth=72
    autocmd FileType gitcommit set formatoptions+=t
augroup END
" }}}

" openscad file settings --------------- {{{
augroup filetype_openscad
    autocmd!
    " comment string used by vim-commentary
    autocmd FileType openscad set commentstring=//\ %s
augroup END
" }}}

" R file settings ---------------------- {{{
augroup filetype_r
    autocmd!
    " comment string used by vim-commentary
    autocmd FileType r set commentstring=#\ %s
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
    autocmd FileType xml setlocal ts=2 sw=2 expandtab
augroup END
" }}}

" on lose focus ------------------------ {{{
augroup on_lose_focus
    " automatically save all buffers after tabbing away from vim
    autocmd FocusLost * :silent wall
augroup END
" }}}
" }}}


" commands ---------------------------------------------------------- {{{

" Show syntax highlighting groups for word under cursor
" nmap <C-S> :call <SID>SynStack()<CR>
" function! <SID>SynStack()
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc

" }}}


" set options ------------------------------------------------------- {{{

" ai - copy indent from current line when starting a new line
set autoindent

" ar - automatically re-read an externally-changed file
set autoread

" bs - enable backspace to consume linefeeds, etc.
set backspace=indent,eol,start

" cc - place line-width indicator in column 79
set colorcolumn=79

" cot - only insert the longest common text of matches
set completeopt=longest,menu

" ch - number of screen lines to use for command line
set cmdheight=2

" cpo - put $ at end of change target (word, line, etc.)
set cpoptions+=$

" cul - highlight line cursor is on
set cursorline

" enc - default encoding is UTF-8
set encoding=utf-8

" et - enter spaces when tab is pressed
set expandtab

" fo - specify text wrapping particulars
"    c - Auto-wrap comments using textwidth.
"    n - Recognize numbered lists
"    o - Continue comments when 'O/o'pen line above/below commented line
"    q - Allow formatting comments with gq
"    r - Continue comments when hitting 'r'eturn (Enter) in insert mode
"    t - Auto-wrap text using textwidth
set formatoptions=cnoqrt1

" gfn - choose display font and size
" set guifont=Source\ Code\ Pro\ Light:h13
" set guifont=Source\ Code\ Pro\ Light\ for\ Powerline:h12
set guifont=Source\ Code\ Pro:h13

" hid - allow unsaved buffers to rotate to background
set hidden

" hi - number of commands to save in command history
set history=1000

" hls - highlight matches for find buffer
set nohlsearch

" ic - ignore case in search if all lower case (see smartcase too)
set noignorecase

" is - move cursor to next match with each additional search character
set incsearch

" ls - always show status line
set laststatus=2

" list - show newline and tab characters
set nolist

" lcs - use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" mls - mitigate a security vulnerability
set modelines=5

" more - do or don't page command output (i.e. show '-- More --' message)
set nomore

" mouse - enable mouse in all modes
set mouse=a

" js - single space between sentences on join lines
set nojoinspaces

" noswf - don't create a swapfile
set noswapfile

" nu - set line numbering on
set number

" rnu - line numbers are relative to current line
set relativenumber

" ru - set row/col numbers to appear in status line
set ruler

" so - minimum lines of context at top and bottom
set scrolloff=3

" sh - shell to use for :! commands
if has("macunix")
    " set shell=/usr/local/bin/zsh
    set shell=/bin/zsh
elseif has("unix")
    set shell=/usr/bin/zsh
else
    set shell=/usr/local/bin/zsh
endif

" set shellcmdflag=-ci
set shellcmdflag=-c

" sw - set width of indents/dedents
set shiftwidth=4

" shm - suppress mid-screen startup message
set shortmess+=I

" sc - show command on last line of screen
set showcmd

" sm - briefly jump to matching bracket with bracket is inserted
set showmatch

" smd - show when in Insert, Replace, or Visual mode
set showmode

" sts - set tab width for backspacing
set softtabstop=4

" scs - make search case-sensitive if an uppercase character in search string
set nosmartcase

" sb - make new horz splits appear below current window
set splitbelow

" spr - make new vert splits appear to right of current window
set splitright

" ts - set tab width
set tabstop=4

" tw - max line length before wrapping
set textwidth=79

" tm - delay waiting for next keystroke after leader
set timeoutlen=1000

" ttm - delay waiting for key code (esc sequence for special key like <S-PgUp>¬
set ttimeoutlen=20

" tf - enable faster (higher bandwidth) screen redrawing
set ttyfast

" udf - create persisted undo history
set undofile

" udir - specify directory for undo files
set undodir=~/.vim/undo//

" ve - allow cursor to travel where there is no actual character
set virtualedit=block

" wig - ignore uneditable files
set wildignore=*.pyc,*.o

" wmnu - enhance command-line tab-completion
set wildmenu
set wildmode=list:longest

" wh - minimum number of lines for current window
" wmh - minimum number of lines for non-current windows
set winheight=5
set winminheight=3
set winheight=199

" wiw - minimum number of columns for current window
set winwidth=86

" wrap - wrap lines longer than the width of the window
set wrap

" }}}


" keyboard remappings ----------------------------------------------- {{{

" leader commands ------------------------------------------ {{{

let mapleader=","
" map regular role of comma to backslash
nnoremap \ ,

" <leader> - switch to alternate buffer
nnoremap <leader><leader> <C-^>

" 1-4 - reStructuredText headings
nnoremap <leader>1 :RivTitle1<CR>
nnoremap <leader>2 :RivTitle2<CR>
nnoremap <leader>3 :RivTitle3<CR>
nnoremap <leader>4 :RivTitle4<CR>

" b - wipe current buffer (and close window)
nnoremap <silent> <leader>b :bw<CR>

" c - close current window
nnoremap <silent> <leader>c :clo<CR>

" e - open file in same directory as current file
map <leader>e :e %%

" gd - :Gdiff
map <leader>gd :Gdiff<CR>

" gs - :Gstatus
map <leader>gs :Gstatus<CR>

" gw - :Gwrite
map <leader>gw :Gwrite<CR>

" h - toggle highlight of last search matches
nnoremap <leader>h :set hlsearch!<CR>

" l - toggle show invisibles
nnoremap <leader>l :set list!<CR>

" n - toggle show line numbers
nnoremap <leader>n :set number!<CR>

" ob - open _scratch/blank.rst in split below, stay in current window
nnoremap <leader>ob :split _scratch/blank.rst<CR><C-w>k

" ov - open ~/.vimrc file in split below current
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

" sp - open horizontal split window
nnoremap <leader>sp :split<CR>

" sv - source ~/.vimrc (after changes)
nnoremap <leader>sv :source $MYVIMRC<CR>

" t - test
nnoremap <leader>t :w\|!py.test<CR>

" T - set current module to run on ,t
function! MakeCurrentBufferTestModule()
    let l:path=expand('%')
    execute 'nnoremap <leader>t :w\|!py.test -x --wip ' l:path "<CR>"
    echo ',t: ' . l:path
endfunc
nnoremap <silent> <leader>T :call MakeCurrentBufferTestModule()<CR>

" v - vertical split
map <leader>v :vsp<CR>

" w - write current buffer
nnoremap <leader>w :w<CR>

" x - cut to system pasteboard (for cut/paste)
vnoremap <leader>x "*x

" y - yank to system pasteboard ('copy' for copy/paste)
vnoremap <leader>y "*y

" z - suspend to shell prompt
nnoremap <leader>z <C-Z>

" }}}

" global mappings ------------------------------------------ {{{

" use F5 to toggle between Solarized light and dark background
call togglebg#map("<F5>")

" }}}

" command mode --------------------------------------------- {{{

" %% expands to directory of current buffer
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" get prior (and next) command that starts-with current string
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" }}}

" insert mode ---------------------------------------------- {{{

" jk instead of Esc
inoremap jk <Esc>

" Ctrl-b is move left one character
inoremap <C-b> <Left>

" Ctrl-f is move right one character in insert mode
inoremap <C-f> <Right>

" Ctrl-k is kill (to end of line) in insert mode
inoremap <C-k> <C-\><C-O>D

" }}}

" normal mode ---------------------------------------------- {{{

" Enter - turn off search highlighting
" nnoremap <CR> :nohlsearch<CR>

" space - toggle fold
nnoremap <space> za

" gs goes to first non-blank on line
nnoremap gs ^

" always screen lines for up and down motion
nnoremap j gj
nnoremap k gk

" Y - yanks to end of line (instead of entire line, like yy)
nnoremap Y y$

" map Ctrl+{movement} keys to navigate between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" bubble single line (breaks in latest version, using unimpaired at least)
" nmap - [e
" nmap - zi[ezi
nmap - ddkP
" nmap _ ]e
" nmap _ zi]ezi
nmap _ ddp
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp
" bubble multiple lines
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]

" }}}

" }}}
