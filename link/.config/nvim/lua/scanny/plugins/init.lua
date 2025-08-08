return {

  -- === EXPERIMENTAL ========================================================

  -- "Canop/nvim-bacon",

  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = function()
      require("bqf").setup({
        auto_resize_height = true,
        preview = {
          win_height = 40,
        }
      })
    end
  },

  "lukas-reineke/cmp-under-comparator",


  -- ==== LANGUAGE SERVER PROTOCOL (LSP) =====================================

  "neovim/nvim-lspconfig", -- enable LSP cofiguration library and some utils --


  -- === LOCAL DEVELOPMENT PLUGINS ===========================================
  {
    "scanny/nvim-plugin",
    dev = true
  },

  -- common dependencies --
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins


  -- === TREESITTER ==========================================================

  -- provides AST-aware highlighting, folding, and indent --
  {
    "nvim-treesitter/playground",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },


  -- === LANGUAGE SUPPORT ====================================================

  -- provides Cucumber language syntax and folding --
  "tpope/vim-cucumber",

  -- GO ------------------------------------

  -- {
  --   "fatih/vim-go",
  --   config = function ()
  --     -- disable default key bindings that interfere --
  --     vim.g.go_def_mapping_enabled = 0
  --   end
  -- },

  -- JSON ----------------------------------

  "gennaro-tedesco/nvim-jqx",


  -- === GIT =================================================================

  -- jump to github page for current file, commit, etc. --
  "tpope/vim-rhubarb",


  -- === EDITING =============================================================

  -- more powerful camel/snake-case aware text substitution with :S instead of :s --
  "tpope/vim-abolish",

  -- improved '*' search-under-cursor behaviors --
  "haya14busa/vim-asterisk",

  -- provides filetype-aware code commenting --
  "tpope/vim-commentary",

  -- allows renames etc. on a buffer and its file --
  "tpope/vim-eunuch",

  -- store dynamically updated session files --
  "tpope/vim-obsession",

  -- repeat plugin actions with '.' command --
  "tpope/vim-repeat",

  -- enable changing surrounding pairs like quotes in single action --
  "tpope/vim-surround",

  -- add text object for segment (like "bar" in foo_bar_baz) in a variable --
  {
    "Julian/vim-textobj-variable-segment",
    dependencies = { "kana/vim-textobj-user" },
  },

}
