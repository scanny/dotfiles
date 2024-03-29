" a priori items ---------------------------------------------------- {{{

set nocompatible
filetype off

" }}}


" terminal-related settings ----------------------------------------- {{{

" " --- supports truecolor ---
" set termguicolors

" " --- small adjustments for tmux-256color from xterm-256color ---
" set t_8f=[38;2;%lu;%lu;%lum  " set RGB foreground color (true-color)
" set t_8b=[48;2;%lu;%lu;%lum  " set RGB background color (true-color)

" --- set cursor to block in normal mode, vert bar in insert mode ---

" OS X (iTerm2) version
if has("macunix")
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"  " S-tart I-nsert (bar-cursor)
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"  " E-nd I-nsert (change to block-cursor)
    " let &t_ti = "\<Esc>]50;CursorShape=0\x7"  " put terminal into termcap mode
    " let &t_te = "\<Esc>]50;CursorShape=1\x7"  " end of termcap mode
endif

" " Linux on iTerm2 via ssh
" if has("unix")
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif

" }}}


" load plugins ------------------------------------------------------ {{{

call plug#begin('~/.vim/plugged')

" --- 'Black'-ens Python code on save ---
Plug 'psf/black', { 'branch': 'stable' }

" --- rip-grep in Vim; multi-file search ---
Plug 'wincent/ferret'

" --- speeds-up code folding, avoiding certain pathological cases ---
Plug 'Konfekt/FastFold'

" --- fuzzy-file finding and more ---
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" --- Accordion-style file drawer with preview ---
Plug 'preservim/nerdtree'

" --- Fancy status line formatting and indicators ---
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" --- restructuredText support ---
Plug 'gu-fan/riv.vim'

" --- Efficient code folding for Python, which is a hard case because of sig-space ---
Plug 'tmhedberg/SimpylFold'

" --- lints on every save ---
Plug 'scrooloose/syntastic'

" --- add n-ext target ---
Plug 'wellle/targets.vim'

" --- jump around git and merge conflicts ---
Plug 'wincent/vcs-jump'

" --- more powerful camel/snake-case aware text substitution with :S instead of :s ---
Plug 'tpope/vim-abolish'

" --- provides Solarized color scheme ---
Plug 'altercation/vim-colors-solarized'

" --- provides filetype-aware code commenting ---
Plug 'tpope/vim-commentary'

" --- enhanced close-by file navigation using '-' key ---
Plug 'justinmk/vim-dirvish'

" --- allows renames etc. on a buffer and its file ---
Plug 'tpope/vim-eunuch'

" --- Git support ---
Plug 'tpope/vim-fugitive'

" --- JSON support, folding, etc. ---
Plug 'elzr/vim-json'

" --- session save and restore ---
Plug 'tpope/vim-obsession'

" --- subtle alignment improvements on <CR> in Python code ---
Plug 'Vimjas/vim-python-pep8-indent'

" --- repeat plugin-commands with '.' key ---
Plug 'tpope/vim-repeat'

" --- display marks in gutter ---
Plug 'kshenoy/vim-signature'

" --- horizontal find with 2-letters ---
Plug 'justinmk/vim-sneak'

" --- write view files to remember where you were in file ---
Plug 'zhimsel/vim-stay'

" --- additional 'surrounding' text-objects like parens, quotes, etc. ---
Plug 'tpope/vim-surround'

" --- handy bracket mappings like ']q' for :cnext
Plug 'tpope/vim-unimpaired'

Plug 'sjl/vitality.vim'

" --- tab completions ---
Plug 'Valloric/YouCompleteMe'

" ---maybe install again later---
" Plug 'rbong/vim-flog'
" Plug 'gerw/vim-HiLinkTrace'
" Plug 'vim-python/python-syntax',
" Plug 'SirVer/ultisnips'
" Plug 'tpope/vim-cucumber',   {'pinned': 1}
" Plug 'Twinside/vim-haskellFold'
" Plug 'sukima/xmledit'

call plug#end()

" filetype plugin indent on
" syntax on

" }}}


" configure plugins ------------------------------------------------- {{{

""installed in OS X -----------------

"if has("macunix")
"    " powerline
"    set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"    " UltiSnips
"    " let g:UltiSnipsExpandTrigger="<Tab>"
"    " let g:UltiSnipsJumpForwardTrigger="<Tab>"
"    " let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
"    " YouCompleteMe
"    let g:ycm_key_list_previous_completion=['<Up>']
"endif

"" these plugins are installed in Linux ---------------------

"if has("unix")
"    " powerline
"    set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
"endif


"" built-ins ------------------------------------------------
let loaded_matchparen = 1


"" FastFold -------------------------------------------------
let g:fastfold_savehook = 0


"" netrw ----------------------------------------------------
"let g:netrw_list_hide = '.*\.pyc$'
"let g:netrw_hide = 1


" python-syntax --------------------------------------------

" " Python 2 mode
" let g:python_version_2 = 0

" " Python 2 mode (buffer local)
" let b:python_version_2 = 0

" Highlight builtin functions and objects
"let g:python_highlight_builtins = 1

" Highlight builtin objects only
" let g:python_highlight_builtin_objs = 0

" Highlight builtin functions only
" let g:python_highlight_builtin_funcs = 0

" Highlight builtin functions when used as kwarg
" let g:python_highlight_builtin_funcs_kwarg = 1

" Highlight standard exceptions
" let g:python_highlight_exceptions = 0

" Highlight % string formatting
" let g:python_highlight_string_formatting = 0

" " Highlight syntax of str.format syntax
" let g:python_highlight_string_format = 0

" " Highlight syntax of string.Template
" let g:python_highlight_string_templates = 0

" " Highlight indentation errors
" let g:python_highlight_indent_errors = 0

" Highlight trailing spaces
"let g:python_highlight_space_errors = 1

" Highlight doc-tests
" let g:python_highlight_doctests = 0

" Highlight class variables self and cls
let g:python_highlight_class_vars = 1

" Highlight all operators
" let g:python_highlight_operators = 0

" Enable all highlight options above, except for previously set.
"let g:python_highlight_all = 1

" Highlight shebang and coding headers as comments
"let g:python_highlight_file_headers_as_comments = 1

" Disable for slow machines (default: 1)
"let g:python_slow_sync = 1


" powerline ------------------------------------------------
let g:Powerline_symbols = 'fancy'


" riv ------------------------------------------------------

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

" Let <CR> stay as :nohlsearch
let g:riv_ignored_nmaps = '<CR>'

" Ctrl-Q is leader for Riv commands
let g:riv_global_leader = '<C-q>'


" SimpylFold -----------------------------------------------
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 1

" --- Solarized color scheme ---
if strftime("%H") > 6 && strftime("%H") < 17
    set background=light
else
    set background=dark
endif

colorscheme solarized

" -- invisibles (e.g. newlines) - low: subdued, normal: gray, high: red
let g:solarized_visibility = "normal"
" -- trailing space hilighting --
"let g:solarized_hitrail = 1  
" -- turn extra MacVim menu on or off---
let g:solarized_menu = 0


"" syntastic ------------------------------------------------
let g:syntastic_auto_loc_list = 1
"let g:syntastic_cursor_columns = 0
"let g:syntastic_echo_current_error = 0
"let g:syntastic_enable_baloons = 0
"let g:syntastic_enable_signs = 0
"let g:syntastic_filetype_map = { "tmpl": "html" }
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_rst_checkers = []


"" UltiSnips ------------------------------------------------
"function! g:UltiSnips_Complete()
"  call UltiSnips#ExpandSnippet()
"  if g:ulti_expand_res == 0
"    if pumvisible()
"      return "\<C-n>"
"    else
"      call UltiSnips#JumpForwards()
"      if g:ulti_jump_forwards_res == 0
"        return "\<TAB>"
"      endif
"    endif
"  endif
"  return ""
"endfunction

"function! g:UltiSnips_Reverse()
"  call UltiSnips#JumpBackwards()
"  if g:ulti_jump_backwards_res == 0
"    return "\<C-P>"
"  endif
"  return ""
"endfunction

"if !exists("g:UltiSnipsJumpForwardTrigger")
"  let g:UltiSnipsJumpForwardTrigger = "<tab>"
"endif

"if !exists("g:UltiSnipsJumpBackwardTrigger")
"  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"endif

"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"


"" vim-commentary -------------------------------------------

"" release traditional comment mappings to avoid key delay
"" xunmap \\
"" nunmap \\
"" nunmap \\\
"" nunmap \\u


"" vim-json -------------------------------------------------
let g:vim_json_syntax_conceal = 0


"" vim-python-pep8-indent -----------------------------------
"let g:python_pep8_indent_multiline_string = -1


"" Vitality -------------------------------------------------
"let g:vitality_always_assume_iterm = 1


"" XML Syntax -----------------------------------------------
let g:xml_syntax_folding=1


"" YouCompleteMe --------------------------------------------

let g:ycm_auto_hover = ""
let g:ycm_auto_trigger = 1
let g:ycm_key_detailed_diagnostics = ""
let g:ycm_disable_signature_help = 1
let g:ycm_filetype_blacklist = {
    \ 'rst' : 1,
\}

" }}}


" utility functions ------------------------------------------------- {{{

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

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

" restore CR in special windows -------- {{{
augroup vimrc_CRfix
  autocmd!
  " Quickfix, Location list, &c. remap <CR> to work as expected
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
  autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
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

" Cucumber file settings ------------------- {{{
augroup filetype_cucumber
    autocmd!
    autocmd FileType cucumber setlocal fdm=indent sw=2
augroup END
" }}}

" dirvish buffer settings ------------------ {{{
autocmd! FileType dirvish setlocal relativenumber
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

" JSON file settings ------------------- {{{
augroup filetype_json
    autocmd!
    autocmd FileType json setl nowrap
    autocmd FileType json setl foldmethod=syntax
augroup END
" }}}

" gitcommit file settings ----------------- {{{
augroup filetype_gitcommit
    autocmd!
    " tw - max line length before wrapping
    autocmd FileType gitcommit set colorcolumn=73 textwidth=72
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

" Python file settings------------------ {{{
augroup filetype_python
    autocmd!
    " ---don't wrap Python windows---
    autocmd FileType python set fdm=expr nowrap so=3 textwidth=88
    autocmd BufWritePre *.py execute ':Black'
augroup END
" }}}

" R file settings ---------------------- {{{
augroup filetype_r
    autocmd!
    " comment string used by vim-commentary
    autocmd FileType r set commentstring=#\ %s
augroup END
" }}}

" rst file settings -------------------- {{{
augroup filetype_rst
    autocmd!
    " set spell-check on
    autocmd FileType rst setlocal nospell sw=4 sts=4
augroup END
" }}}

" text file settings -------------------- {{{
augroup filetype_text
    autocmd!
    autocmd FileType text setlocal nowrap textwidth=0 wrapmargin=0
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

" on lose focus ------------------------ {{{
augroup on_lose_focus
    " automatically save all buffers after tabbing away from vim
    autocmd FocusLost * :silent wall
augroup END
" }}}

" }}}


" set options ------------------------------------------------------- {{{

" ai - copy indent from current line when starting a new line
set autoindent

" ar - automatically re-read an externally-changed file
set autoread

" bs - enable backspace to consume linefeeds, etc.
set backspace=indent,eol,start

" cc - place line-width indicator in column 89 (one past wrap limit)
set colorcolumn=89

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

" fcs - chars with which to fill statuslines and vertical separators
set fillchars+=stl:\ ,stlnc:\

" fo - specify text wrapping particulars
"    c - Auto-wrap comments using textwidth.
"    n - Recognize numbered lists
"    o - Continue comments when 'O/o'pen line above/below commented line
"    q - Allow formatting comments with gq
"    r - Continue comments when hitting 'r'eturn (Enter) in insert mode
"    t - Auto-wrap text using textwidth
set formatoptions=cnoqrt1

" gfn - choose display font and size
set guifont=Source\ Code\ Pro\ for\ Powerline:h13
" set guifont=Source\ Code\ Pro\ for\ Powerline\ Light:h12
" set guifont=Source\ Code\ Pro:h13

" go - GUI options like scrollbars
" --- remove left and right scrollbars ---
set guioptions-=rL

" hid - allow unsaved buffers to rotate to background
set hidden

" hi - number of commands to save in command history
set history=10000

" hls - highlight matches for find buffer
set hlsearch

" ic - ignore case in search if all lower case (see smartcase too)
set noignorecase

" is - move cursor to next match with each additional search character
set incsearch

" ls - always show status line
set laststatus=2

" list - hide/show newline and tab characters
set nolist

" lcs - use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" mls - mitigate a security vulnerability
set modelines=5

" more - do or don't page command output (i.e. show '-- More --' message)
set nomore

" mouse - enable mouse in all modes
set mouse=nich

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
set shell=/usr/local/bin/zsh

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

" titlestring - set MacVim window title to current directory
" set titlestring+=\ pwd:\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}

" scs - make search case-sensitive if an uppercase character in search string
set nosmartcase

" spf - location of word list file for spell check
set spellfile=$HOME/.vim/spell/en.utf-8.add

" spl - specify spelling language
set spelllang=en

" sb - make new horz splits appear below current window
set splitbelow

" spr - make new vert splits appear to right of current window
set splitright

" ts - set tab width
set tabstop=4

" tw - max line length before wrapping
set textwidth=88

" tm - delay waiting for next keystroke after leader
set timeoutlen=1000

" ttm - delay waiting for key code (esc sequence for special key like <S-PgUp>¬
set ttimeoutlen=20

" tf - enable faster (higher bandwidth) screen redrawing
set ttyfast

" udf - create persisted undo history
set undofile

" udir - specify directory for undo files
set undodir=~/.vim/undo

" vop - view options, remove some for vim-stay plugin
set viewoptions=cursor,folds

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
set winwidth=92

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

" D - open 'TODO.rst'
nnoremap <silent> <leader>D :vsplit _scratch/TODO.rst<CR>

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

" h - toggle highlight of last search matches
" nnoremap <leader>h :set hlsearch!<CR>

" l - toggle show invisibles
nnoremap <leader>l :set list!<CR>

" L - set current LeetCode module to run on ,t and make executable
function! MakeCurrentBufferLeetCodeModule()
    let l:path=expand('%')
    execute 'nnoremap <leader>t :w\|! ' l:path "<CR>"
    execute 'silent !chmod +x ' l:path
    echo 'LeetCoded: ' . l:path
endfunc
nnoremap <silent> <leader>L :call MakeCurrentBufferLeetCodeModule()<CR>

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

" R - replace matches in search buffer
nnoremap <leader>R :%s//

" sp - open horizontal split window
nnoremap <leader>sp :split<CR>

" ss - syntax S-ync from S-tart
nnoremap <leader>ss :syntax sync fromstart<CR>

" sv - source ~/.vimrc (after changes)
nnoremap <leader>sv :source $MYVIMRC<CR>

" t - test
nnoremap <leader>t :w\|!py.test -x<CR>

" T - set current module to run on ,t
function! MakeCurrentBufferTestModule()
    let l:path=expand('%')
    execute 'nnoremap <leader>t :w\|!py.test -x -q --tb=native ' l:path "<CR>"
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

" Enter - :noh - turn off search highlighting
nnoremap <CR> :nohlsearch<CR>

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

" -- bubble single line --
" nmap - [e
" nmap _ ]e
" brute-force method
" nmap - zi[ezi
" nmap - ddkP
" nmap _ zi]ezi
" nmap _ ddp
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp
" bubble multiple lines
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]

" --- fzf mappings ---
function! MinExec(cmd)
	redir @a
	exec printf('silent %s',a:cmd)
	redir END
	return @a
endfunction

function! GetMappings()
	let lines=MinExec('map')
	let lines=split(lines,'\n')
	return lines
endfunction

nnoremap <silent> <C-a>M :call fzf#run({'source': GetMappings(),'options': '-m'} )<CR>

" }}}

" }}}
