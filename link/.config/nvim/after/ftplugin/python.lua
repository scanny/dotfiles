-- line-length/window-width --
vim.opt_local.colorcolumn = "101"
vim.opt_local.scrolloff = 3
-- wrap comments at 98 so they can be commented out without a lint error. Code that breaks early
-- will be reformatted to 100 on save so isn't a problem.
vim.opt_local.textwidth = 98
vim.opt_local.winwidth = 110
vim.opt_local.wrap = false

-- indent --
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4

-- folding settings --
vim.opt.foldlevelstart = 0  -- collapse all folds in new window --
vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
vim.wo.foldlevel = 0
vim.opt_local.foldnestmax = 2

-- set leap.nvim highlight color to black-on-white for visibility --
vim.api.nvim_set_hl(
  0,
  'LeapLabelPrimary',
  -- {fg = 'black', bg = 'white', bold = true, nocombine = true },
  {fg = 'white', bg = 'black', bold = true, nocombine = true }
)
-- turn off search-highlighting style applied to TODO: comments --
-- this approach turns it off globally, like for all languages, which might actually be good, but if
-- so it belongs somewhere global, like in init.lua, not here.
-- vim.api.nvim_set_hl( 0, 'Todo', { link = "Comment" }) 
-- vim.cmd("syntax clear pythonTodo")

-- remap `gq` such that it works for formatting paragraphs in multi-line docstrings --
vim.keymap.set('n', 'gq', "gwip", { noremap = true, silent = true, desc = 'Format Paragraph in Python' })

-- custom fold rules --
vim.treesitter.query.set("python", "folds", [[
  [(function_definition)(class_definition)] @fold
]])

-- explicitly start TreeSitter for Python files --
vim.treesitter.start()
