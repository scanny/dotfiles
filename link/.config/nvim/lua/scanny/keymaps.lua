
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--  c - command_mode
--  i - insert_mode
--  n - normal_mode
--  t - term_mode
--  v - visual_mode
--  x - visual_block_mode


-- DELETEME - convenient mapping while developing treesitter-plugin --
keymap("n", "vx", ':lua require"nvim-plugin".select()<CR>', opts)


-- leader is comma ---
vim.g.mapleader = ","


-- === GLOBAL MAPPINGS ===============================================

-- use F5 to toggle between light and dark background ---
vim.cmd([[
    map <F5> :let &background = ( &background == "dark" ? "light" : "dark" )<CR>
]])

-- DAP key mappings
vim.keymap.set("n", "<F1>", ":lua require'dap-python'.test_method()<CR>")
vim.keymap.set("n", "<leader>di", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>du", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", '<leader>dv', ":lua require'dap.ui.widgets'.hover()<CR>")
vim.keymap.set("n", '<leader>df', ":Telescope dap frames<CR>")


-- === LEADER COMMANDS =============================================== {{{

-- double-<leader> - switch to alternate buffer ---
keymap("n", "<leader><leader>", "<C-^>", opts)

-- ,b - wipe current buffer (and close window) ---
keymap("n", "<leader>b", ":bw<CR>", opts)

-- ,c - close current window ---
keymap("n", "<leader>c", ":clo<CR>", opts)

-- ,fr - Telescope lsp-references --
keymap("n", "<leader>fr", ":Telescope lsp_references<CR>", opts)

-- ,gs - :Git (status) ---
keymap("n", "<leader>gs", ":Git<CR>", opts)

-- ,l - toggle show invisibles ---
keymap("n", "<leader>l", ":set list!<CR>", opts)

-- ,ob - open _scratch/blank.rst in split below, stay in current window ---
keymap("n", "<leader>ob", ":split _scratch/blank.rst<CR><C-w>k", opts)

-- ,od - open 'TODO.rst' ---
keymap("n", "<leader>od", ":vsplit _scratch/TODO.md<CR><C-w>L", opts)

-- ,op - open 'plugins.lua' (packer file) ---
keymap(
  "n",
  "<leader>op",
  ":vsplit " .. vim.fn.stdpath("config") .. "/lua/scanny/plugins.lua<CR><C-W>H",
  opts
)

-- ,ov - open ~/.config/nvim/init.vim file in split below current ---
keymap("n", "<leader>ov", ":split $MYVIMRC<CR>", opts)

-- ,p - paste from clipboard ---
keymap("n", "<leader>p", "\"*p", opts)

-- ,P - paste before from clipboard
keymap("n", "<leader>P", "\"*P", opts)

-- ,q - hardwrap current paragraph (like Ctrl-Q) ---
keymap("n", "<leader>q", "gqip", opts)

-- ,rl - reload current buffer ---
vim.keymap.set(
  "n",
  "<leader>rl",
  function ()
    local bufnr = vim.api.nvim_get_current_buf()
    local is_modified = vim.api.nvim_buf_get_option(bufnr, "modified")

    -- short-circuit if the buffer has unsaved-changes --
    if is_modified then
      print("buffer has unsaved changes")
      return
    end

    -- get the path so we can reload this same file --
    local file_path = vim.fn.expand("%:p")

    -- move to next buffer so split doesn't close when we wipe original buffer. If this
    -- is the only buffer it still works because window doesn't close, just gets the
    -- [No Name] buffer.
    vim.api.nvim_command("bnext")

    -- wipe the current buffer; force false should be redundant but doesn't hurt --
    vim.api.nvim_buf_delete(bufnr, { force = false })

    -- open the file again, getting a new buffer and fresh reparse --
    vim.api.nvim_command("edit " .. vim.fn.fnameescape(file_path))
  end,
  opts
)

-- ,sp - open horizontal split window ---
keymap("n", "<leader>sp", ":split<CR>", opts)

-- ,ss - reSync syntax from Start ---
keymap("n", "<leader>ss", ":syntax sync fromstart<CR>", opts)

-- ,t - test ---
keymap("n", "<leader>t", ":w|!py.test -x<CR>", opts)

-- ,u - toggle undo-tree window --
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- ,v - vertical split ---
keymap("n", "<leader>v", ":vsplit<CR>", opts)

-- ,w - write current buffer ---
keymap("n", "<leader>w", ":write<CR>", opts)

-- ,x - cut to system pasteboard (for cut/paste) ---
keymap("n", "<leader>x", "\"*x", opts)

-- ,y - yank to system pasteboard ('copy' for copy/paste) ---
keymap("v", "<leader>y", '"*y', {})

-- ,z - suspend to shell prompt ---
keymap("v", "<leader>z", "<C-Z>", {})

-- }}}


-- === NORMAL-MODE COMMANDS ========================================== {{{

-- ][t - tabnext/prev --
keymap("n", "[t", ":tabprev<CR>", opts)
keymap("n", "]t", ":tabnext<CR>", opts)

-- space - toggle fold --
keymap("n", "<space>", "za", opts)

-- reselect pasted text --
keymap("n", "gp", "`[v`]", opts)

-- gs - move to first non-blank on line --
keymap("n", "gs", "^", opts)

-- always use screen lines for up and down motion --
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

-- pasting over selection preserves default register --
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
