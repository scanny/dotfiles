-- line-length/window-width --
vim.opt_local.scrolloff = 3
vim.opt_local.textwidth = 100
vim.opt_local.winwidth = 108
vim.opt_local.wrap = false

-- folding settings --
vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldnestmax = 3
