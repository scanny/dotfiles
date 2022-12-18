-- Configuration for vim-maximizer plugin --

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- ,m - maximize current split --
keymap("n", "<leader>m", ":MaximizerToggle<CR>", opts)
