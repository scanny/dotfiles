-- Configuration for vim-fugitive plugin

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- ,gb - :G blame ---
keymap("n", "<leader>gb", ":G blame<CR>", opts)

-- ,gB - :GBrowse ---
keymap("n", "<leader>gB", ":GBrowse<CR>", opts)
keymap("v", "<leader>gB", ":'<,'>GBrowse<CR>", opts)

-- ,gw - :Gwrite ---
keymap("n", "<leader>gw", ":Gwrite<CR>", opts)

-- os - open spike:% in split above and place cursor there ---
keymap("n", "<leader>os", ":split<CR><C-w>k:Gedit spike:%<CR>", opts)
