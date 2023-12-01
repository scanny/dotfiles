return {
  "tpope/vim-fugitive",
  config = function()

    -- ,gb - :G blame ---
    vim.keymap.set("n", "<leader>gb", "<cmd>G blame<CR>", {desc="Git Blame"})

    -- ,gB - :GBrowse ---
    vim.keymap.set(
      "n", "<leader>gB", "<cmd>GBrowse<CR>", {desc="Git Browse (on GitHub)"}
    )
    vim.keymap.set(
      "v", "<leader>gB", "<cmd>'<,'>GBrowse<CR>", {desc="Browse on GitHub"}
    )

    -- ,gw - :Gwrite ---
    vim.keymap.set(
      "n", "<leader>gw", "<cmd>Gwrite<CR>", {desc="Add this file to Git index."}
    )

    -- os - open spike:% in split above and place cursor there ---
    vim.keymap.set(
      "n",
      "<leader>os",
      "<cmd>split<CR><C-w>k<cmd>Gedit spike:%<CR>",
      {desc="Open spike-branch version of this file in split above."}
    )
  end,
}
