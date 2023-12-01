-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/
--      server_configurations.md#ruff_lsp
-- for the default config, along with instructions on how to customize the settings.

-- Define a custom diagnostic handler for Ruff-LSP
local ruff_diagnostic_handler = function(err, method, result, client_id, bufnr, config)
  if result and result.diagnostics then
    -- Iterate over the diagnostics and change their severity to 'Error'
    for _, diagnostic in ipairs(result.diagnostics) do
      diagnostic.severity = vim.lsp.protocol.DiagnosticSeverity.Error
    end
  end

  -- Call the default diagnostic handler
  vim.lsp.handlers["textDocument/publishDiagnostics"](
    err, method, result, client_id, bufnr, config
  )
end

require('lspconfig').ruff_lsp.setup {
  on_attach = function(client, bufnr)
    require('scanny.lsp.config').on_attach(client, bufnr)
    client.handlers['textDocument/publishDiagnostics'] = ruff_diagnostic_handler
  end,
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {
        "--config=./pyproject.toml",
      },
    }
  },
  root_dir = require('lspconfig').util.find_git_ancestor,
}
