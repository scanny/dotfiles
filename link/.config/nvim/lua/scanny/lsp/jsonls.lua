require('lspconfig').jsonls.setup({
    on_attach = require('scanny.lsp.config').on_attach,
    filetypes = {"json", "jsonc"},
    init_options = { provideFormatter = true },
})
