return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      -- automatically install "ensure-installed" language parsers --
      auto_install = true,
      ensure_installed = {
        "bash",
        "dockerfile",
        "gitignore",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "rst",
        "vim",
        "yaml",
        "xml",
      },
      -- List of parsers to ignore installing --
      ignore_install = { "markdown" },
      sync_install = false,

      -- CONFIGURE EXTENSIONS ------------------------------------------------------

      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = { "html", "xml" },
      },

      folding = {
        enable = true,
        disable = {"cucumber"},
      },

      highlight = {
        -- false will disable the whole extension --
        enable = true,
        -- list of languages for which highlighting will be disabled --
        -- disable = { "markdown" },
        disable = {},
        -- true will use vim syntax as well, slower but supports indentation ---
        additional_vim_regex_highlighting = { "markdown" },
      },

      indent = {
        enable = true,
        disable = {"cucumber", "markdown", "yaml"},
      },

      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = true, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      },
    })

  end,

}
