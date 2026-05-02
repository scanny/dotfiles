-- line-length/window-width --
vim.opt_local.colorcolumn = "101"
vim.opt_local.scrolloff = 3
-- wrap comments at 98 so they can be commented out without a lint error. Code that breaks early
-- will be reformatted to 100 on save so isn't a problem.
vim.opt_local.textwidth = 98
vim.opt_local.winwidth = 108
vim.opt_local.wrap = false

-- indent --
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4

-- folding settings --
vim.opt.foldlevelstart = 0  -- collapse all folds in new window --
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt_local.foldlevel = 0
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldnestmax = 3

-- formatoptions - Don't add comment prefix on (o)pen a line below --
vim.opt_local.formatoptions:remove("o")

-- custom fold rules --
vim.treesitter.query.set("rust", "folds", [[
  [
    (mod_item)
    (function_item)
    (struct_item)
    (enum_item)
    (impl_item)
  ] @fold
]])
