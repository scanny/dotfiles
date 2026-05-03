return {
  "hrsh7th/nvim-cmp",  -- The completion plugin
  lazy = false,
  priority = 100,
  dependencies = {
    "hrsh7th/cmp-buffer",                   -- buffer completions
    "hrsh7th/cmp-cmdline",                  -- cmdline completions
    "hrsh7th/cmp-nvim-lsp",                 -- LSP completions
    "hrsh7th/cmp-nvim-lsp-signature-help",  -- function signatures
    "hrsh7th/cmp-nvim-lua",                 -- Neovim's Lua runtime API (e.g. vim.*)
    "hrsh7th/cmp-path",                     -- path completions
    "onsails/lspkind.nvim",                 -- icons in completion window
    "saadparwaiz1/cmp_luasnip",             -- Suggest LuaSnip completions
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "lukas-reineke/cmp-under-comparator",   -- sort dunder methods lower --
  },
  config = function ()
    require "scanny.completion"
  end,
}
