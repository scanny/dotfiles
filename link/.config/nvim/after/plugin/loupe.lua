-- Configuration for wincent/loupe plugin

local keymap = vim.api.nvim_set_keymap

-- no automatic \v in :substitute ---
vim.g.LoupeVeryMagic = 0


-- Enter - :noh - turn off search highlighting (autocmd suppresses this in quickfix) --
keymap("n", "<CR>", "<Plug>(LoupeClearHighlight)", {})
