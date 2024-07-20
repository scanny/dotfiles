-- line-length/window-width --
vim.opt_local.colorcolumn = "101"
vim.opt_local.linebreak = true
vim.opt_local.scrolloff = 3
vim.opt_local.textwidth = 100
vim.opt_local.winwidth = 108
vim.opt_local.wrap = false

-- indent --
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4

-- folding settings --
vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldnestmax = 6

-- formatting - turn off formatting comments with `gq` --
vim.opt_local.formatoptions:remove("q")

-- concealed text like code-blocks and emphasis 0=not-hidden, 2=hidden --
vim.opt_local.conceallevel = 0

-- turn off pesky TODO bracket highlighting --
vim.api.nvim_set_hl(0, "@text.todo", {})
