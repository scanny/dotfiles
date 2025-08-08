
-- === GLOBAL LSP SETUP ========================================================

local signs = {
  { name = 'DiagnosticSignError', text = '' },
  { name = 'DiagnosticSignWarn', text = '' },
  -- { name = 'DiagnosticSignHint', text = '' },
  { name = 'DiagnosticSignHint', text = '' },
  { name = 'DiagnosticSignInfo', text = '' },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end

vim.diagnostic.config({
  -- virtual text shows message at end of line --
  virtual_text = {
    -- don't show warnings in virtual text, to avoid unused param warnings on methods
    -- like `.__exit__()` that have prescribed params.
    severity = {
      min = vim.diagnostic.severity.WARN,
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
  -- severity_sort = true,
  severity_sort = {reverse = true},
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
    source = 'if_many',
    -- source = true,
    style = 'minimal',
  },
})

require('lspconfig').eslint.setup({
  on_attach = function(client, bufnr)
    local buf_set_keymap = vim.api.nvim_buf_set_keymap
    local bufopts = { noremap=true, silent=true }
    -- ,dh - diagnostics-hide --
    buf_set_keymap(
      bufnr, "n", "<leader>dh", "<cmd>lua vim.diagnostic.disable(0)<CR>", bufopts
    )
    -- ,dr - LspRestart --
    buf_set_keymap(bufnr, "n", "<leader>dr", "<cmd>LspRestart<CR>", bufopts)
    -- ,ds - diagnostics-show --
    buf_set_keymap(
      bufnr, "n", "<leader>ds", "<cmd>lua vim.diagnostic.enable(0)<CR>", bufopts
    )
    -- -- disable tsserver formatting, use null-ls instead --
    -- client.resolved_capabilities.document_formatting = false
    -- client.resolved_capabilities.document_range_formatting = false
  end,
})

-- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
--   vim.lsp.handlers.hover, { border = 'rounded' }
-- )

-- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
--   vim.lsp.handlers.hover, { border = 'rounded' }
-- )

-- vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
--   vim.lsp.handlers.signature_help, { border = 'rounded' }
-- )

-- ============================================================================

vim.lsp.enable("eslint")

require('scanny.lsp.bashls')
require('scanny.lsp.gopls')
require('scanny.lsp.jsonls')
require('scanny.lsp.lua-ls')
require('scanny.lsp.pyright')
require('scanny.lsp.ruff')
require('scanny.lsp.rust')
