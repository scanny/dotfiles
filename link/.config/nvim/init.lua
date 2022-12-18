vim.g.python3_host_prog = "/Users/scanny/.virtualenvs/nvim/bin/python3"
vim.g.ruby_host_prog = "/usr/local/lib/ruby/gems/3.1.0/bin/neovim-ruby-host"

-- don't highlight matching bracket indefinitely and obscure cursor ---
vim.g.loaded_matchparen = 1

vim.g.FerretCommandNames = { Black = 'Fblack'}

-- vim-markdown config -----------------------------------------------
-- disable broken auto-insert of bullets ---
vim.g.vim_markdown_auto_insert_bullets = 0

-- disable conceal of e.g. ``` ---
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0

-- Next line after bullet is indented 2 spaces (not 4) ---
vim.g.vim_markdown_new_list_item_indent = 2
-- Don't indent on new-line after bullet ---
-- vim.g.vim_markdown_new_list_item_indent = 0
----------------------------------------------------------------------

-- require 'scanny'

require 'scanny.options'
require 'scanny.autocommands'
require 'scanny.plugins'
require 'scanny.cmp'
require 'scanny.lsp'
require 'scanny.telescope'
require 'scanny.treesitter'
require 'scanny.keymaps'       -- keymaps last to override any set in plugins



-- vim.cmd('colorscheme solarized')
-- vim.cmd('colorscheme gruvbox')
vim.cmd('colorscheme gruvbox-material')


-- vim-go config -----------------------------------------------------
-- disable default key bindings that interfere ---
vim.g.go_def_mapping_enabled = 0


vim.cmd [[


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

" a - wrap function args in parens onto separate lines
nnoremap <silent> <leader>a :ArgWrap<CR>

" gw - :Gwrite
map <leader>gw :Gwrite<CR>

" h - Highline Toggle
nmap <leader>h <Plug>(HighlineToggle)  # highlight current line
xmap <leader>h <Plug>(HighlineToggle)  # highlight selected lines

" H - Highline Clear (all highlighted lines)
nmap <leader>H <Plug>(HighlineClear)

" }}}


" === configure plugins ============================================== {{{

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
" let g:syntastic_python_checkers = ['flake8']
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

" }}}

]]
