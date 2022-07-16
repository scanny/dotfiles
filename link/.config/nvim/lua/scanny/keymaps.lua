
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--  c - command_mode
--  i - insert_mode
--  n - normal_mode
--  t - term_mode
--  v - visual_mode
--  x - visual_block_mode


-- === GLOBAL MAPPINGS ===============================================

-- use F5 to toggle between light and dark background ---
vim.cmd([[
    map <F5> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>
]])


-- === LEADER COMMANDS =============================================== {{{

-- leader is comma ---
vim.g.mapleader = ","

-- double-<leader> - switch to alternate buffer ---
keymap("n", "<leader><leader>", "<C-^>", opts)

-- b - wipe current buffer (and close window) ---
keymap("n", "<leader>b", ":bw<CR>", opts)

-- c - close current window ---
keymap("n", "<leader>c", ":clo<CR>", opts)

-- e - open file in same directory as current file ---
keymap("n", "<leader>e", ":e %%", opts)

-- gw - :Gwrite ---
keymap("n", "<leader>gw", ":Gwrite<CR>", opts)

-- l - toggle show invisibles ---
keymap("n", "<leader>l", ":set list!<CR>", opts)

-- m - maximize current split ---
keymap("n", "<leader>m", ":MaximizerToggle<CR>", opts)

-- ob - open _scratch/blank.rst in split below, stay in current window ---
keymap("n", "<leader>ob", ":split _scratch/blank.rst<CR><C-w>k", opts)

-- od - open 'TODO.rst' ---
keymap("n", "<leader>od", ":vsplit _scratch/TODO.md<CR><C-w>L", opts)

-- os - open spike:% in split above and place cursor there ---
keymap("n", "<leader>os", ":split<CR><C-w>k:Gedit spike:%<CR>", opts)

-- ov - open ~/.config/nvim/init.vim file in split below current ---
keymap("n", "<leader>ov", ":split $MYVIMRC<CR>", opts)

-- p - paste from clipboard ---
keymap("n", "<leader>p", "\"*p", opts)

-- P - paste before from clipboard
keymap("n", "<leader>P", "\"*P", opts)

-- q - hardwrap current paragraph (like Ctrl-Q) ---
keymap("n", "<leader>q", "gqip", opts)

-- sp - open horizontal split window ---
keymap("n", "<leader>sp", ":split<CR>", opts)

-- ss - reSync syntax from Start ---
keymap("n", "<leader>ss", ":syntax sync fromstart<CR>", opts)

-- -- sv - source ~/.vimrc (after changes) ---
-- keymap("n", "<leader>sv", ":source $MYVIMRC<CR>", opts)

-- t - test ---
keymap("n", "<leader>t", ":w|!py.test -x<CR>", opts)

-- v - vertical split ---
keymap("n", "<leader>v", ":vsplit<CR>", opts)

-- w - write current buffer ---
keymap("n", "<leader>w", ":write<CR>", opts)

-- x - cut to system pasteboard (for cut/paste) ---
keymap("n", "<leader>x", "\"*x", opts)

-- y - yank to system pasteboard ('copy' for copy/paste) ---
keymap("v", "<leader>y", '"*y', {})

-- z - suspend to shell prompt ---
keymap("v", "<leader>z", "<C-Z>", {})

-- }}}


-- === NORMAL-MODE COMMANDS ========================================== {{{

-- space - toggle fold --
keymap("n", "<space>", "za", opts)

-- Enter - :noh - turn off search highlighting (autocmd suppresses this in quickfix) --
-- keymap("n", "<CR>", ":nohlsearch<CR>", opts)
keymap("n", "<CR>", "<Plug>(LoupeClearHighlight)", {})

-- reselect pasted text --
keymap("n", "gp", "`[v`]", opts)

-- gs - move to first non-blank on line --
keymap("n", "gs", "^", opts)

-- always screen lines for up and down motion --
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Q - exit quickly when multiple windows are open (like quick-fix pane) --
keymap("n", "Q", ":qa<CR>", opts)

-- Y - yanks to end of line (instead of entire line, like yy)
keymap("n", "Y", "y$", opts)

-- zx - refold around current and center in vertical space --
keymap("n", "zx", "zxzz", opts)

-- Ctrl+{movement} keys navigate between windows --
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-h>", "<C-w>h", opts)

-- }}}


-- === INSERT-MODE COMMANDS ========================================== {{{

-- jk instead of Esc --
keymap("i", "jk", "<Esc>", opts)
keymap("i", "JK", "<Esc>", opts)

-- Ctrl-k is kill (to end of line) in insert mode. Note this overrides insert di-graph
-- which is Vim built-in mapping of insert-mode Ctrl-k.
keymap("i", "<C-k>", "<C-\\><C-O>D", opts)

-- }}}


-- === VISUAL-MODE COMMANDS ========================================== {{{

-- pasting over selection preserves default register ---
keymap("v", "p", "\"_dP", opts)

-- -- Stay in indent mode while indenting a block --
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- }}}


-- === COMMAND-MODE COMMANDS ========================================= {{{

-- %% expands to directory of current buffer
keymap("c", "%%", "<C-R>=expand('%:h').'/'<CR>", opts)

-- get prior (and next) command that starts-with current string
keymap("c", "<C-p>", "<Up>", {})
keymap("c", "<C-n>", "<Down>", {})

-- }}}


-- -- === TELESCOPE KEY BINDINGS ======================================== {{{

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- -- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<C-t>", "<cmd>Telescope live_grep<cr>", opts)

-- }}}
