vim.g.python3_host_prog = "/Users/scanny/.virtualenvs/nvim/bin/python3"
vim.g.ruby_host_prog = "/usr/local/lib/ruby/gems/3.1.0/bin/neovim-ruby-host"

-- don't highlight matching bracket indefinitely and obscure cursor ---
vim.g.loaded_matchparen = 1

vim.g.FerretCommandNames = { Black = 'Fblack'}

-- require 'scanny'

require 'scanny.options'
require 'scanny.autocommands'
require 'scanny.plugins'
require 'scanny.cmp'
require 'scanny.lsp'
require 'scanny.lualine'
require 'scanny.keymaps'       -- keymaps last to override any set in plugins


-- vim.cmd('colorscheme solarized')
-- vim.cmd('colorscheme gruvbox')
vim.cmd('colorscheme gruvbox-material')


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

" h - Highline Toggle
nmap <leader>h <Plug>(HighlineToggle)  # highlight current line
xmap <leader>h <Plug>(HighlineToggle)  # highlight selected lines

" H - Highline Clear (all highlighted lines)
nmap <leader>H <Plug>(HighlineClear)

" }}}


" === configure plugins ============================================== {{{


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
