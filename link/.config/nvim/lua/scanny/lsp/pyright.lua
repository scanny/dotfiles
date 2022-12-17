
local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

require('lspconfig').pyright.setup({
  capabilities = capabilities,
  filetypes = {
    'python',
  },
  on_attach = require('scanny.lsp.config').on_attach,
  settings = {
    python = {
      analysis = {
        -- typeCheckingMode = 'off',
        -- typeCheckingMode = 'basic'
        typeCheckingMode = 'strict',
        -- executionEnvironments = {
        --   { root = '/Users/scanny/SpacedOut/chatbot/apps/cws', },
        -- },
        -- stubPath = '/Users/scanny/SpacedOut/chatbot/apps/cws/stubs',
        -- venv = 'chatbot',
        -- venvPath = '/Users/scanny/.virtualenvs',
      }
    }
  }
})
