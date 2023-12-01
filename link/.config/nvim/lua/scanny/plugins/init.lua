return {

  -- === LOCAL DEVELOPMENT PLUGINS ===========================================
  {
    "scanny/nvim-plugin",
    dev = true
  },

  -- common dependencies --
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins


  -- ==== LANGUAGE SERVER PROTOCOL (LSP) =====================================

  "neovim/nvim-lspconfig",              -- enable LSP


  -- === TREESITTER ==========================================================

  -- provides AST-aware highlighting, folding, and indent --
  {
    "nvim-treesitter/playground",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },


  -- === DEBUG ADAPTER PROTOCOL (DAP) SUPPORT ================================

  -- DAP support for neovim --
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'theHamsta/nvim-dap-virtual-text',
      'nvim-telescope/telescope-dap.nvim',
    }
  },
  "mfussenegger/nvim-dap-python",
  {"rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },


  -- === LANGUAGE SUPPORT ====================================================

  -- provides Cucumber language syntax and folding --
  "tpope/vim-cucumber",

  -- GO ------------------------------------

  {
    "fatih/vim-go",
    config = function ()
      -- disable default key bindings that interfere --
      vim.g.go_def_mapping_enabled = 0
    end
  },

  -- JSON ----------------------------------

  "gennaro-tedesco/nvim-jqx",

  -- Markdown support --
  {
    "preservim/vim-markdown",
    config = function ()
      -- enable conceal of inline formatting characters --
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_conceal_code_blocks = 0

      -- folds include the heading --
      vim.g.vim_markdown_folding_style_pythonic = 1

      -- set indent after list item --
      vim.g.vim_markdown_new_list_item_indent = 2
    end
  },

  -- PYTHON --------------------------------

  -- 'Black'-ens Python code on save --
  {
    "psf/black",
    ft = "python",
    tag="19.10b0",
  },

  -- better indent behavior after colon etc. on Python --
  {
    "Vimjas/vim-python-pep8-indent",
    enabled =false,
  },


  -- === GIT =================================================================

  -- jump to github page for current file, commit, etc. --
  "tpope/vim-rhubarb",


  -- === EDITING =============================================================

  -- visible-space navigation --
  {
    "ggandor/leap.nvim",
    config = function ()
      require("leap").set_default_keymaps()
    end,
  },

  -- show and navigate full undo tree --
  "mbbill/undotree",

  -- more powerful camel/snake-case aware text substitution with :S instead of :s --
  "tpope/vim-abolish",

  -- improved '*' search-under-cursor behaviors --
  "haya14busa/vim-asterisk",

  -- provides filetype-aware code commenting --
  "tpope/vim-commentary",

  -- allows renames etc. on a buffer and its file --
  "tpope/vim-eunuch",

  -- highlight individual lines --
  "airblade/vim-highline",

  -- store dynamically updated session files --
  "tpope/vim-obsession",

  -- repeat plugin actions with '.' command --
  "tpope/vim-repeat",

  -- write better buffer persistance (view) files --
  "zhimsel/vim-stay",

  -- enable changing surrounding pairs like quotes in single action --
  "tpope/vim-surround",

  -- add text object for segment (like "bar" in foo_bar_baz) in a variable --
  {
    "Julian/vim-textobj-variable-segment",
    dependencies = { "kana/vim-textobj-user" },
  },

}
