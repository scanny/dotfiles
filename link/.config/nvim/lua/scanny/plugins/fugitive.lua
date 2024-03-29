return {
  "tpope/vim-fugitive",
  keys = {
    -- ,gb - :G blame ---
    { "<leader>gb", "<cmd>G blame<CR>", desc = "Git Blame" },

    -- ,gB - :GBrowse ---
    { "<leader>gB", "<cmd>GBrowse<CR>", desc = "Git Browse (on GitHub)" },
    { "<leader>gB", "<cmd>'<,'>GBrowse<CR>", mode = "v", desc = "Browse on GitHub" },

    -- ,gw - :Gwrite ---
    { "<leader>gw", "<cmd>Gwrite<CR>", desc = "Add this file to Git index." },

    -- os - open spike:% in split above and place cursor there ---
    {
      "<leader>os",
      "<cmd>split<CR><C-w>k<cmd>Gedit spike:%<CR>",
      desc = "Open spike-branch version of this file in split above.",
    },
  },
}
