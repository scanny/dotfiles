
require("nvim-treesitter.configs").setup {
    ensure_installed = { "bash", "go", "javascript", "json", "lua", "python", "rst" },
    sync_install = false,
    -- List of parsers to ignore installing --
    ignore_install = { "markdown" },
    highlight = {
        -- false will disable the whole extension --
        enable = true,
        -- list of languages for which highlighting will be disabled --
        disable = { "markdown" },
        -- true will use vim syntax as well, slower but supports indentation ---
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
        disable = {"markdown", "python", "yaml"},
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
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
    pyfold = {
        enable = true,
        custom_foldtext = false
  }
}

-- --------------------------------------------------------------------------------
-- Folding is still pretty funky, resets when Black runs, etc. Maybe set in autocmd
-- based on filetype
-- --------------------------------------------------------------------------------
-- fdm - specify method used for computing folds ---
-- vim.opt.foldmethod = "expr"

-- fde - specify expression used for computing folds ---
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- --------------------------------------------------------------------------------
