-- Configure `rust-analyzer`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
-- For the default config, along with instructions on how to customize the settings

local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
local lspconfig = require "lspconfig"
local on_attach = require('scanny.lsp.config').on_attach

lspconfig.rust_analyzer.setup{
  capabilities = capabilities,
  cmd = {
    "rustup", "run", "stable", "rust-analyzer"
  },
  on_attach = on_attach,
  settings = {
  --   ['rust-analyzer'] = {
  --     diagnostics = {
  --       enable = false;
  --     }
  --   }
  }
}
