-- Configuration for riv (reStructuredText) plugin

-- disable pesky table auto-formatting
vim.g.riv_auto_format_table = 0

-- update folds on file save
vim.g.riv_fold_auto_update = 1

-- show blank lines at end of fold, except the first one
vim.g.riv_fold_blank = 0

-- turn folding on
vim.g.rst_fold_enabled = 1

-- don't fold lists
vim.g.riv_fold_level = 1

-- Ctrl-Q is leader for Riv commands
vim.g.riv_global_leader = '<C-q>'

-- Let <CR> stay as :nohlsearch
vim.g.riv_ignored_nmaps = '<CR>'

-- Avoid 'maxmempattern' error on certain lines
vim.g.riv_link_cursor_hl = 0

