
-- line-length/window-width --
vim.opt_local.colorcolumn = "101"
vim.opt_local.scrolloff = 3
vim.opt_local.textwidth = 98
vim.opt_local.winwidth = 110
vim.opt_local.wrap = false

-- indent --
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.tabstop = 2

-- folding settings --
vim.opt.foldlevelstart = 0  -- collapse all folds in new window --
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldmethod = "expr"
vim.wo.foldlevel = 0
vim.opt_local.foldnestmax = 6

-- set custom fold rules for typst to override TreeSitter's default queries which fold a bit too
-- much for my taste.
vim.treesitter.query.set("typst", "folds", [[
  ; -- 1. fold set blocks, but only at the tope level, not when nested --
  (source_file (code [ (set) (let) (show) ] @fold))

  ; -- 2. Fold all sections --
  (section) @fold

  ; -- 3. Fold list items ONLY when they are direct children of a section's content --
  (section (content (item) @fold))
]])

-- Available nodes for folding in typst: --
-- (set)
-- (let)
-- (show)
-- (call)
-- (section)
-- (for)
-- (branch)
-- (content)
-- (raw_blck)
