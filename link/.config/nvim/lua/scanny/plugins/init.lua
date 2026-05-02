return {

  -- === EXPERIMENTAL ========================================================

  -- code folding --
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = { "kevinhwang91/promise-async" },
  --   event = "BufRead",
  --   opts = {},
  -- },

  -- {
  --   "chrisgrieser/nvim-origami",
  --   event = "VeryLazy",
  --   opts = {  -- required even when using default config
  --     useLspFoldsWithTreesitterFallback = {
  --       enabled = true,
  --       foldmethodIfNeitherIsAvailable = "indent", ---@type string|fun(bufnr: number): string
  --     },
  --     pauseFoldsOnSearch = true,
  --     foldtext = {
  --       enabled = false,
  --       -- padding = {
  --       --   character = " ",
  --       --   width = 3,  ---@type number|fun(win: number, foldstart: number, currentVirtualTextLength: number): number
  --       --   hlgroup = nil,
  --       -- },
  --       -- lineCount = {
  --       --   template = "%d lines", -- `%d` is replaced with the number of folded lines
  --       --   hlgroup = "Comment",
  --       -- },
  --       -- diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
  --       -- gitsignsCount = true, -- requires `gitsigns.nvim`
  --       -- disableOnFt = { "snacks_picker_input" }, ---@type string[]
  --     },
  --     autoFold = {
  --       enabled = false,
  --       -- kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
  --     },
  --     foldKeymaps = {
  --       setup = false,
  --       -- setup = true, -- modifies `h`, `l`, `^`, and `$`
  --       -- closeOnlyOnFirstColumn = false, -- `h` and `^` only fold in the 1st column
  --       -- scrollLeftOnCaret = false, -- `^` should scroll left (basically mapped to `0^`)
  --     },
  --   },

  --   -- recommended: disable vim's auto-folding
  --   init = function()
  --     vim.opt.foldlevel = 99
  --     vim.opt.foldlevelstart = 99
  --   end,
  -- },

  -- Typst --

  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy=false,
  },

  {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '1.*',
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  },

  -- marks --
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- D2 language support (experimental) --
  {"terrastruct/d2-vim", ft = { "d2" }},
  {
    "ravsii/tree-sitter-d2",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    version = "*",
    build = "make nvim-install",
  },

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

  -- "gennaro-tedesco/nvim-jqx",


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
