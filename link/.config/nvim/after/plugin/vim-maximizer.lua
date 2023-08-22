-- Configuration for vim-maximizer plugin --

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- suppress <F3> default key-mapping --
vim.g.maximizer_set_default_mapping = 0

-- ,m - maximize current split --
keymap("n", "<leader>m", ":MaximizerToggle<CR>", opts)
