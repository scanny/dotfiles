-- suppress <F3> default key-mapping --
vim.g.maximizer_set_default_mapping = 0

return {
  "szw/vim-maximizer",
  keys = {
    { "<leader>m", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize a split" } },
  },
}
