
-- === GLOBAL LSP SETUP ========================================================

local signs = {
  { name = 'DiagnosticSignError', text = '' },
  { name = 'DiagnosticSignWarn', text = '' },
  { name = 'DiagnosticSignHint', text = '' },
  { name = 'DiagnosticSignInfo', text = '' },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end

local config = {
  -- virtual text shows message at end of line --
  virtual_text = {
    -- don't show warnings in virtual text, to avoid unused param warnings on methods
    -- like `.__exit__()` that have prescribed params.
    severity = {
      min = vim.diagnostic.severity.ERROR,
    },
    source = false,  -- true places this at front, include at end instead via format --
    format = function(diagnostic)
      return string.format(
        '%s\n%s: %s', diagnostic.message, diagnostic.source, diagnostic.code
      )
    end,
  },
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = false,
  underline = true,
  reverse = true,
  severity_sort = true,
  float = {
    border = 'rounded',
    focusable = false,
    format =  function(diagnostic)
      return string.format(
        '%s\n%s: %s', diagnostic.message, diagnostic.source, diagnostic.code
      )
    end,
    header = '',
    prefix = '',
    source = 'always',
    style = 'minimal',
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { border = 'rounded' }
)

-- ============================================================================

require('scanny.lsp.bashls')
require('scanny.lsp.gopls')
require('scanny.lsp.jsonls')
require('scanny.lsp.lua-ls')
require('scanny.lsp.pyright')
require('scanny.lsp.ruff')
require('scanny.lsp.rust')
