
local M = {}

-- local function lsp_highlight_document(client)
--   -- Set autocommands conditional on server_capabilities
--   if client.resolved_capabilities.document_highlight then
--     vim.api.nvim_exec(
--       [[
--       augroup lsp_document_highlight
--         autocmd! * <buffer>
--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--       augroup END
--     ]],
--       false
--     )
--   end
-- end


-- buffer-local LSP keymaps set when server attaches to buffer ---
local function lsp_keymaps(bufnr)
  local bufopts = { noremap=true, silent=true }
  local buf_set_keymap = vim.api.nvim_buf_set_keymap

  -- AST-aware navigation ------------------------------------------------------
  buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', bufopts)
  buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', bufopts)
  buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', bufopts)
  buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', bufopts)
  buf_set_keymap(bufnr, 'n', '<leaderD>', '<cmd>lua vim.lsp.buf.type_definition()<CR>', bufopts)

  -- help ----------------------------------------------------------------------
  buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', bufopts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', bufopts)
  buf_set_keymap(
    bufnr,
    'n',
    'gl',
    "<cmd>lua vim.diagnostic.open_float(0, { scope = 'line', source = 'always', border = 'single' })<CR>",
    bufopts
  )

  -- navigation ----------------------------------------------------------------
  buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', bufopts)
  buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', bufopts)
  buf_set_keymap(bufnr, 'n', '<leader>L', '<cmd>lua vim.diagnostic.setloclist()<CR>', bufopts)

  -- workspace support ---------------------------------------------------------
  -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set(
  --   'n',
  --   '<leader>wl',
  --   function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
  --   bufopts
  -- )

  -- virtual-text display ------------------------------------------------------
  -- ,d - clear <leader>d set by VcsJump plugin ---
  -- vim.api.nvim_del_keymap("n", "<leader>d")
  -- ,dh - diagnostics-hide ---
  buf_set_keymap(bufnr, "n", "<leader>dh", "<cmd>lua vim.diagnostic.disable(0)<CR>", bufopts)
  -- ,ds - diagnostics-show ---
  buf_set_keymap(bufnr, "n", "<leader>ds", "<cmd>lua vim.diagnostic.enable(0)<CR>", bufopts)

  -- refactoring ---------------------------------------------------------------
  buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', bufopts)
  -- buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', bufopts)

  -- formatting ----------------------------------------------------------------
  -- buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', bufopts)

  -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end


-- M.on_attach = function(client, bufnr)
M.on_attach = function(_, bufnr)
  lsp_keymaps(bufnr)
  -- lsp_highlight_document(client)
  -- if client.name == 'tsserver' then
  --   client.resolved_capabilities.document_formatting = false
  -- end
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()

-- local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
-- if not status_ok then
--   return
-- end

-- M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
