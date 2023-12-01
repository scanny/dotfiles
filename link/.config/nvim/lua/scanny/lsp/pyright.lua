
local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
local util = require('lspconfig/util')

require('lspconfig').pyright.setup({
  capabilities = capabilities,
  filetypes = {
    'python',
  },
  on_attach = require('scanny.lsp.config').on_attach,
  root_dir = function(fname)
    local root_files = {'pyrightconfig.json'}
    if not unpack then
      unpack = table.unpack
    end
    return (
      util.root_pattern(unpack(root_files))(fname)
      or util.find_git_ancestor(fname)
      or util.path.dirname(fname)
    )
  end,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'strict',
      }
    }
  }
})
