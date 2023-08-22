
let mapleader = ","

" -- jk works for Escape --
imap jk <Esc>

" -- b - wipe current buffer (and close window) ---
nmap <leader>b :bw<CR>

" -- c - close current window ---
nmap <leader>c :clo<CR>

" -- <leader>w -> write --
nmap <leader>w :w<CR>

" -- splits ---
nmap <leader>sp :split<CR>
nmap <leader>v :vsplit<CR>

" -- Q to quit all --
nmap Q :qa<CR>

nmap <C-h> <C-h>j
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" -- show line numbers --
set nu

" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif
