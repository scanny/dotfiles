-- Configuration for wincent/loupe plugin

local keymap = vim.api.nvim_set_keymap

-- has to be set earlier than this, in init.lua --
-- vim.g.LoupeVeryMagic = 0


-- Enter - :noh - turn off search highlighting (autocmd suppresses this in quickfix) --
keymap("n", "<CR>", "<Plug>(LoupeClearHighlight)", {})
