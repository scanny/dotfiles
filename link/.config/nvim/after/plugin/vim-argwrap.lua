-- Configuration for vim-argwrap plugin

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- a - wrap function args in parens onto separate lines
keymap("n", "<leader>a", ":ArgWrap<CR>", opts)

-- last item in list gets comma too
vim.g.argwrap_tail_comma = 1
