
require('lspconfig').pyright.setup({
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
        -- stubPath = '',
      }
    }
  }
})
