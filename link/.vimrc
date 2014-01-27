" a priori items ----------------------------------------------------{{{

set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

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


" manage plugin bundles ---------------------------------------------{{{

" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

" other bundles installed
Bundle 'kien/ctrlp.vim'
Bundle 'Rykka/riv.vim'
Bundle 'tmhedberg/SimpylFold'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-abolish'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-obsession'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'nelstrom/vim-qargs'
Bundle 'tpope/vim-repeat'
Bundle 'justinmk/vim-sneak'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'sjl/vitality.vim'
Bundle 'sukima/xmledit'

" skip these bundles if on Cygwin
if has("macunix")
    Bundle 'Lokaltog/powerline'
    Bundle 'SirVer/ultisnips'
    Bundle 'Valloric/YouCompleteMe'
endif

" these bundles are compatible with Linux
if has("unix")
    Bundle 'Lokaltog/powerline'
endif

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
    let g:UltiSnipsExpandTrigger="<S-Tab>"
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
let g:ctrlp_show_hidden = 1


" netrw ----------------------------------------------------
let g:netrw_list_hide = '.*\.pyc$'
let g:netrw_hide = 1


" simpylfold -----------------------------------------------
let g:SimpylFold_docstring_preview = 1


" solarized color scheme -----------------------------------

" invisibles (e.g. newlines) in subdued tone
let g:solarized_visibility = "low"


" syntastic ------------------------------------------------
let g:syntastic_auto_loc_list = 1
let g:syntastic_python_checkers = ['flake8']


" riv ------------------------------------------------------

" update folds on file save
let g:riv_fold_auto_update = 1

" show blank lines at end of fold, except the first one
let g:riv_fold_blank = 0

" don't fold lists
let g:riv_fold_level = 1

" Ctrl-Q is leader for Riv commands
let g:riv_global_leader = '<C-q>'


" Vitality -------------------------------------------------
let g:vitality_always_assume_iterm = 1


" XML Syntax -----------------------------------------------
let g:xml_syntax_folding=1
autocmd FileType xml setlocal foldmethod=syntax

" }}}


" auto-commands ----------------------------------------------------- {{{

" after Vim startup -------------------- {{{
augroup at_end_of_vim_setup
    " wh - minimum number of lines for current window
    " wmh - minimum number of lines for non-current windows
    autocmd!
    autocmd VimEnter set winheight=5
    autocmd VimEnter set winminheight=3
    autocmd VimEnter set winheight=99
augroup END
" }}}

" Python file settings ----------------- {{{
" augroup filetype_python
"     autocmd!
" augroup END
" }}}

" restructuredText (.rst) settings ----- {{{
augroup filetype_rst
    autocmd!
    " use ,pf for preformatted text (double-backtick)
    " autocmd FileType rst inoremap <buffer> <leader>pf ``
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
    autocmd FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
augroup END
" }}}

" on lose focus ------------------------ {{{
augroup on_lose_focus
    " automatically save all buffers after tabbing away from vim
    autocmd FocusLost * :wa
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
set completeopt=longest,menu,preview

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
set formatoptions=qrn1

" gfn - choose display font and size
" set guifont=Source\ Code\ Pro\ Light:h13
" set guifont=Source\ Code\ Pro\ Light\ for\ Powerline:h12
set guifont=Source\ Code\ Pro:h12

" hid - allow unsaved buffers to rotate to background
set hidden

" hi - number of commands to save in command history
set history=250

" hls - highlight matches for find buffer
set nohlsearch

" ic - ignore case in search if all lower case (see smartcase too)
set noignorecase

" is - move cursor to next match with each additional search character
set incsearch

" ls - always show status line
set laststatus=2

" list - show newline and tab characters
set list

" lcs - use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" mls - avoid a security vulnerability
set modelines=5

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
    set shell=/usr/local/bin/zsh
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
set smartcase

" sb - make new horz splits appear below current window
set splitbelow

" spr - make new vert splits appear to right of current window
set splitright

" ts - set tab width
set tabstop=4

" tw - max line length before wrapping
set textwidth=79

" tm - delay waiting for next keystroke after leader
set timeoutlen=2000

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
set winheight=99

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
map <leader>e :edit %%

" gd - :Gdiff
map <leader>gd :Gdiff<CR>

" gs - :Gstatus
map <leader>gs :Gstatus<CR>

" gw - :Gwrite
map <leader>gw :Gwrite<CR>

" l - toggle show invisibles
nnoremap <leader>l :set list!<CR>

" n - toggle show line numbers
nnoremap <leader>n :set number!<CR>

" ov - open ~/.vimrc file in vertically split window
nnoremap <leader>ov :split $MYVIMRC<CR>

" p - paste from clipboard
nnoremap <leader>p "*p

" P - paste before from clipboard
nnoremap <leader>P "*P

" q - hardwrap current paragraph (like Ctrl-Q)
nnoremap <leader>q gqip

" r - toggle relative line numbers
function! ToggleRelativeNumber()
  if(&relativenumber == 1)
    set number
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

" v - vertical split
map <leader>v :vsp<CR>

" w - write current buffer
nnoremap <leader>w :w<CR>

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
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" }}}

" insert mode ---------------------------------------------- {{{

" jk instead of Esc
inoremap jk <Esc>

" Ctrl-k is kill (to end of line) in insert mode
inoremap <C-k> <C-\><C-O>D

" }}}

" normal mode ---------------------------------------------- {{{

" Enter - turn off search highlighting
" nnoremap <CR> :nohlsearch<CR>

" space - toggle fold
nnoremap <space> za

" Ctrl+d - insert datetime now
" nnoremap <C-d> a<C-r>=strftime("%Y-%m-%d %H:%M")<CR><Esc>

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

" bubble single line
nmap - [e
nmap _ ]e
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp
" bubble multiple lines
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]

" }}}

" }}}
