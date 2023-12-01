--------------------------------------------------------------------------------------
-- like autopairs, but for XML-tags

return {
  "windwp/nvim-ts-autotag",
  enabled = true,
  dependencies = "nvim-treesitter/nvim-treesitter",
  -- config = true,
  -- config = function ()
  --   require("nvim-ts-autotag").setup(
  --     {
  --       enable = true,
  --       -- enable_rename = true,
  --       -- enable_close = true,
  --       -- enable_close_on_slash = true,
  --       filetypes = { "html", "xml" },
  --     }
  --   )
  -- end,
  -- opts = {
  --   enable = true,
  --   enable_rename = true,
  --   enable_close = true,
  --   enable_close_on_slash = true,
  --   filetypes = { "html", "xml" },
  -- },
}
