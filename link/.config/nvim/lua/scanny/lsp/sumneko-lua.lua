
require('lspconfig').sumneko_lua.setup({
    on_attach = require('scanny.lsp.config').on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.stdpath('config') .. '/lua'] = true,
                }
            }
        }
    },
})
-- }
