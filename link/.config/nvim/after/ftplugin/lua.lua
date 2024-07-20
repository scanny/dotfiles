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
vim.opt.foldlevelstart = 0  -- collapse all folds in new window --
vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt_local.foldlevel = 0
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldnestmax = 2
