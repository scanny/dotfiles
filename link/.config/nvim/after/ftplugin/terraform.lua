-- line-length/window-width --
vim.opt_local.colorcolumn = "101"
vim.opt_local.scrolloff = 3
vim.opt_local.textwidth = 100
vim.opt_local.winwidth = 108
vim.opt_local.wrap = false

-- indent --
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 2

-- folding settings --
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldlevel = 0
vim.wo.foldmethod = "expr"
vim.opt_local.foldnestmax = 2
