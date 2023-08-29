require('lspconfig').lua_ls.setup({
  on_attach = require('scanny.lsp.config').on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        -- library = {
        --     [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        --     [vim.fn.stdpath('config') .. '/lua'] = true,
        -- }
      }
    }
  },
})
