return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,

  config = function()
    -- local treesitter = require("nvim-treesitter.config")
    local ts = require("nvim-treesitter")

    -- configure treesitter
    ts.setup({
      -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
      install_dir = vim.fn.stdpath('data') .. '/site',
    })

    local ensure_installed = {
      "bash",
      "diff",
      "dockerfile",
      "gitignore",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "python",
      "rst",
      "terraform",
      "typst",
      "vim",
      "yaml",
      "xml",
    }

    -- Only install parsers that are missing
    local installed = require("nvim-treesitter.config").get_installed()
    local missing = vim.tbl_filter(
      function(p)
        return not vim.tbl_contains(installed, p)
      end,
      ensure_installed
    )

    if #missing > 0 then
        ts.install(missing)
    end

  end,
}
