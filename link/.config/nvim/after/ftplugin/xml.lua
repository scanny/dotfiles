-- line-length/window-width --
vim.opt_local.scrolloff = 3
vim.opt_local.textwidth = 100
vim.opt_local.winwidth = 108
vim.opt_local.wrap = false

-- indent --
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 2
-- indentexpr is set in after/indent rather than here in after/ftplugin

-- folding settings --
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.wo[0][0].foldnestmax = 8

-- formatting - turn off formatting comments with `gq` --
vim.opt_local.formatoptions:remove("q")

-- custom fold rules --
vim.treesitter.query.set("xml", "folds", [[
  [
    (element)
    (doctypedecl)
    (Comment)
  ] @fold
]])

-- explicitly start TreeSitter for XML files --
vim.treesitter.start()
