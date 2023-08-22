vim.g.python3_host_prog = "/Users/scanny/.virtualenvs/nvim/bin/python3"
vim.g.ruby_host_prog = "/usr/local/lib/ruby/gems/3.1.0/bin/neovim-ruby-host"

-- don't highlight matching bracket indefinitely and obscure cursor ---
vim.g.loaded_matchparen = 1

require 'scanny.options'
require 'scanny.autocommands'
require 'scanny.dap-config'
require 'scanny.plugins'
require 'scanny.lsp'
require 'scanny.keymaps'       -- keymaps last to override any set in plugins


-- this only works when set early -- no automatic \v added to :s/ ---
vim.g.LoupeVeryMagic = 0


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

]])
