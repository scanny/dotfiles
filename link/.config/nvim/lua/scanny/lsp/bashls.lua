local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
require'lspconfig'.bashls.setup {
  capabilities = capabilities,
  cmd = {"bash-language-server", "start"},
  on_attach = require('scanny.lsp.config').on_attach,
}
