
local lsp_installer = require('nvim-lsp-installer')

-- Register a handler that will be called for all installed servers. Alternatively, you
-- may register handlers on specific server instances (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require('scanny.lsp.handlers').on_attach,
    capabilities = require('scanny.lsp.handlers').capabilities,
  }

  -- if server.name == 'jsonls' then
  --     local jsonls_opts = require('scanny.lsp.settings.jsonls')
  --     opts = vim.tbl_deep_extend('force', jsonls_opts, opts)
  -- end

  if server.name == 'sumneko_lua' then
    local sumneko_opts = require('scanny.lsp.settings.sumneko_lua')
    opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
  end

  if server.name == 'pyright' then
    local pyright_opts = require('scanny.lsp.settings.pyright')
    opts = vim.tbl_deep_extend('force', pyright_opts, opts)
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/
  --  server_configurations.md
  server:setup(opts)
end)

-- lsp_installer.setup(
--     {
--         -- automatically detect which servers to install
--         -- (based on which servers are set up via lspconfig)
--         automatic_installation = true,
--         ui = {
--             icons = {
--                 server_installed = '✓',
--                 server_pending = '➜',
--                 server_uninstalled = '✗'
--             }
--         }
--     }
-- )
