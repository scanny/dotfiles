vim.g.python3_host_prog = "/Users/scanny/.virtualenvs/nvim/bin/python3"
vim.g.ruby_host_prog = "/usr/local/lib/ruby/gems/3.1.0/bin/neovim-ruby-host"

-- don't highlight matching bracket indefinitely and obscure cursor ---
vim.g.loaded_matchparen = 1

require "scanny.options"
require "scanny.keymaps"
require "scanny.autocommands"


vim.cmd [[

" === terminal-related settings ====================================== {{{

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


" === custom and plugin-specific key mappings ======================== {{{

" R - run current module on ,t
function! MakeCurrentBufferRunModule()
    let l:path=expand('%')
    execute 'nnoremap <leader>t :w\|!python ' l:path "<CR>"
    echo ',t: ' . l:path
endfunc
nnoremap <silent> <leader>R :call MakeCurrentBufferRunModule()<CR>

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

" T - set current (test) module to run on ,t
function! MakeCurrentBufferTestModule()
    let l:path=expand('%')
    execute 'nnoremap <leader>t :w\|!py.test -x -q --tb=native --disable-warnings' l:path "<CR>"
    echo ',t: ' . l:path
endfunc
nnoremap <silent> <leader>T :call MakeCurrentBufferTestModule()<CR>

" j* - Jedi definitions
nmap <leader>jd :call jedi#goto_definitions()<CR>
nmap <leader>ju :call jedi#usages()<CR>

" a - wrap function args in parens onto separate lines
nnoremap <silent> <leader>a :ArgWrap<CR>

" f - fzf file finder
map <leader>f :Files<CR>

" gd - :Gdiff
map <leader>gd :Gdiff<CR>

" gs - :Gstatus
map <leader>gs :Gstatus<CR>

" gw - :Gwrite
map <leader>gw :Gwrite<CR>

" h - Highline Toggle
nmap <leader>h <Plug>(HighlineToggle)  # highlight current line
xmap <leader>h <Plug>(HighlineToggle)  # highlight selected lines

" H - Highline Clear (all highlighted lines)
nmap <leader>H <Plug>(HighlineClear)

" }}}


" === load plugins =================================================== {{{

" --- Make sure to use single quotes ---
call plug#begin(stdpath('data') . '/plugged')

" --- 'Black'-ens Python code on save ---
Plug 'psf/black', { 'tag': '19.10b0' }

" --- completion ---
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'

" --- snippets ---
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" --- rip-grep in Vim; multi-file search ---
" --- NOTE: installing ferret causes `E471: Argument required` error unless its :Black
" --- command is remapped (conflicts with Python Black command).
let g:FerretCommandNames={'Black': 'Fblack'}
Plug 'wincent/ferret'

" --- fuzzy-file finding and more ---
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" --- gruvbox color scheme ---
Plug 'ellisonleao/gruvbox.nvim'

" --- lightweight status line ---
Plug 'itchyny/lightline.vim'

" --- better highlighting of search matches ---
Plug 'wincent/loupe'

" --- provides Solarized color scheme ---
Plug 'overcache/NeoSolarized'

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

" --- Tab naming ---
Plug 'gcmt/taboo.vim'

" --- jump around git and merge conflicts ---
Plug 'wincent/vcs-jump'

" --- more powerful camel/snake-case aware text substitution with :S instead of :s ---
Plug 'tpope/vim-abolish'

" --- split args onto separate lines ---
Plug 'FooSoft/vim-argwrap'

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

" --- highlight individual lines ---
Plug 'airblade/vim-highline'

" --- JSON language support ---
Plug 'elzr/vim-json'

" --- Letters instead of numbers for relative lines ---
Plug 'skamsie/vim-lineletters'

" --- markdown (plasticboy) ---
source ~/.config/nvim/plugins/vim-markdown.vim

" --- toggle maximize current split ---
Plug 'szw/vim-maximizer'

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


" --- argwrap --------------------------------------------------------
let g:argwrap_tail_comma = 1


" --- deoplete -------------------------------------------------------
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


" --- NeoSolarized ---------------------------------------------------
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


" --- python-syntax --------------------------------------------------
let g:python_highlight_all = 0
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
"

" --- syntastic ------------------------------------------------------
let g:syntastic_auto_loc_list = 1
let g:syntastic_cursor_columns = 0
let g:syntastic_echo_current_error = 0
let g:syntastic_enable_baloons = 0
let g:syntastic_enable_signs = 0
let g:syntastic_mode_map = {"mode": "active", "passive_filetypes": ["rst"]}
let g:syntastic_python_checkers = ['flake8', 'mypy']
let g:syntastic_python_mypy_args = ""
let g:syntastic_rst_checkers = []


" --- UltiSnips ------------------------------------------------------
let g:UltiSnipsExpandTrigger="<C-u>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"


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

" -- select solarized dark or light based on time-of-day ---
if strftime("%H") > 7 && strftime("%H") < 21
    set background=light
else
    set background=dark
endif

" colorscheme solarized
" colorscheme NeoSolarized
colorscheme gruvbox


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

]]
