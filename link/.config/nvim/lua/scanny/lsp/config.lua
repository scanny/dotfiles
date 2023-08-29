local M = {}

-- buffer-local LSP keymaps set when server attaches to buffer ---
local function lsp_keymaps(bufnr)
  local opts =  { buffer=bufnr, silent=true }
  local bufopts = { noremap=true, silent=true }
  local buf_set_keymap = vim.api.nvim_buf_set_keymap

  -- AST-aware navigation ------------------------------------------------------
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gt", '<cmd>Telescope lsp_type_definitions<CR>', opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)

  -- help ----------------------------------------------------------------------
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, opts)

  -- navigation ----------------------------------------------------------------
  vim.keymap.set(
    'n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts
  )
  vim.keymap.set(
    'n',
    ']d',
    '<cmd>lua vim.diagnostic.goto_next({ border = "rounded",' ..
    ' severity = vim.diagnostic.severity.ERROR })<CR>',
    opts
  )
  vim.keymap.set('n', '<leader>L', vim.diagnostic.setloclist, opts)

  -- virtual-text display ------------------------------------------------------
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

  -- refactoring ---------------------------------------------------------------
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

end


M.on_attach = function(client, bufnr)
  -- add the LSP-specific key-mappings to the buffer --
  lsp_keymaps(bufnr)

  -- lsp_highlight_document(client)

  -- work around lua-ls lacking formatting support --
  if client.name == 'lua_ls' then
    vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")
  end
end

return M
