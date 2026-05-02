return {
  "stevearc/conform.nvim",
  enabled = true,
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {

    -- define formatters --
    formatters_by_ft = {
      -- lua = { "stylua" },
      json = { "prettier" },
      python = { "ruff_format" },
      rust = { "rustfmt", lsp_format = "fallback" },
      typescript = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier" },
    },

    -- set up format-on-save --
    format_on_save = {
      async = false,
      -- lsp_format = "fallback",
      timeout_ms = 500,
    },

    -- customize formatters --
    formatters = {
      prettier = {
        prepend_args = { "--trailing-comma", "es5" },
      },
    },
  },
}
