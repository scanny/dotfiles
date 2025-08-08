-- language providers --
vim.g.python3_host_prog = "/Users/scanny/.virtualenvs/nvim/bin/python3"
vim.g.ruby_host_prog = "/opt/homebrew/Cellar/gem-neovim/0.10.0/bin/neovim-ruby-host"
-- don't try to load a Perl provider --
vim.g.loaded_perl_provider = 0

-- don't highlight matching bracket indefinitely and obscure cursor ---
vim.g.loaded_matchparen = 1

-- specify leader before loading plugins so plugin mappings use right key --
vim.g.mapleader = ","

-- this only works when set early -- no automatic \v added to :s/ ---
vim.g.LoupeVeryMagic = 0

-- NEEDED when running --MAIN brew install --
---@diagnostic disable-next-line duplicate-set-field
vim.deprecate = function() end

require 'scanny.options'
require 'scanny.autocommands'

require 'scanny.lazy'

-- require 'scanny.dap-config'
-- LSP config is in after/plugin/lsp.lua
require 'scanny.keymaps'       -- keymaps last to override any set in plugins
require 'scanny.globals'       -- load a few Lua globals serving as plugin dev utils



vim.cmd([[

" Enable italics
set t_ZH=[3m
set t_ZR=[23m

" -- highlight cursor-line in active window only --
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" -- avoid red-blocks in signature help caused by them being a markdown error
highlight link markdownError NONE

" R - run current module on ,t
function! MakeCurrentBufferRunModule()
    let l:path=expand('%')
    execute 'nnoremap <leader>t :w\|!python ' l:path "<CR>"
    echo ',t: ' . l:path
endfunc
nnoremap <silent> <leader>R :call MakeCurrentBufferRunModule()<CR>

" ,rt - toggle relative line numbers
function! ToggleRelativeNumber()
  if (&relativenumber == 1)
    set number
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <leader>rt :call ToggleRelativeNumber()<CR>

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

]])
