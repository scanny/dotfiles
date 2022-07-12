local configs = require("nvim-treesitter.configs")

configs.setup {
    ensure_installed = {"bash", "json", "lua", "markdown", "python"},
    sync_install = false,
    -- List of parsers to ignore installing --
    ignore_install = { "" },
    highlight = {
        -- false will disable the whole extension --
        enable = true,
        -- list of languages for which highlighting will be disabled --
        disable = { "" },
        -- true will use vim syntax as well, slower but supports indentation ---
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
        disable = {"python", "yaml"},
    }
}

-- fdm - specify method used for computing folds ---
vim.opt.foldmethod = "expr"

-- fde - specify expression used for computing folds ---
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
