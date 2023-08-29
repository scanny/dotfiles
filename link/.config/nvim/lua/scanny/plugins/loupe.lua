--------------------------------------------------------------------------------------
-- better highlighting of search matches

return {
  "wincent/loupe",
  config = function ()
    -- has to be set earlier than this, in init.lua --
    -- vim.g.LoupeVeryMagic = 0

    vim.keymap.set("n", "<CR>", "<Plug>(LoupeClearHighlight)", {})
  end
}
