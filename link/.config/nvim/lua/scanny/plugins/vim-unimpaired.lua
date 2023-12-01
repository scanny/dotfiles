-- handy bracket mappings like ']q' for :cnext --
--
return {
  "tpope/vim-unimpaired",
  config = function()
    -- remove filename keymaps I use for something else ---
    vim.keymap.del("n", "]f")
    vim.keymap.del("n", "[f")
  end,
}
