-- line-length/window-width --
vim.opt_local.colorcolumn = 101
vim.opt_local.scrolloff = 3
vim.opt_local.textwidth = 100
vim.opt_local.winwidth = 108

vim.g.black_linelength = 100

-- indent --
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4

-- folding settings --
vim.opt.foldlevelstart = 0  -- collapse all folds in new window --
vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt_local.foldlevel = 0
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldnestmax = 2

-- set leap.nvim highlight color to black-on-white for visibility --
vim.api.nvim_set_hl(
  0,
  'LeapLabelPrimary',
  -- {fg = 'black', bg = 'white', bold = true, nocombine = true },
  {fg = 'white', bg = 'black', bold = true, nocombine = true }
)

-- execute Black on save --
local group = vim.api.nvim_create_augroup("PythonFileType", {clear = true})
vim.api.nvim_create_autocmd(
  "BufWritePre", {pattern="*.py,*.pyi", command=":Black", group=group}
)
