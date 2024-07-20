-- line-length/window-width --
vim.opt_local.colorcolumn = "73"
vim.opt_local.textwidth = 72
vim.opt_local.wrap = false

-- indent --
vim.opt_local.expandtab = false
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4

-- "t" - autowrap text using 'textwidth'
vim.opt_local.formatoptions:append("t")
