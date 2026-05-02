
-- === GLOBAL LSP SETUP ========================================================

local warn_plus = { min = vim.diagnostic.severity.WARN }

vim.diagnostic.config({

  -- configure floating/popup diagnostic windows --
  float = {
    border = "rounded",
    focusable = false,
    format =  function(diagnostic)
      return string.format(
        '%s\n%s: %s', diagnostic.message, diagnostic.source, diagnostic.code
      )
    end,
    header = '',
    prefix = '',
    source = 'if_many',
    style = 'minimal',
  },

  -- show diagnostics in reading order, not last->first order --
  -- reverse = true,

  -- show errors before warnings --
  -- severity_sort = {reverse = true},
  severity_sort = true,

  -- show icons in gutter --
  signs = {
    -- suppress gutter signs for HINT diagnostics, in particular pyright unused variable --
    severity = warn_plus,
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },

  underline = true,

  -- only refresh diagnostics where returning to NORMAL mode --
  update_in_insert = false,

  -- virtual text shows message at end of line --
  virtual_text = {
    -- don't show info diagnostics in virtual text, to avoid unused param warnings on methods
    -- like `.__exit__()` that have prescribed params.
    severity = warn_plus,
    source = false,  -- true places this at front, include at end instead via format --
    format = function(diagnostic)
      return string.format(
        '%s\n%s: %s', diagnostic.message, diagnostic.source, diagnostic.code
      )
    end,
  },

})

-- ============================================================================

-- Global LSP configuration for all servers
vim.lsp.config('*', {
  on_attach = function(_, bufnr)
    local buf_set_keymap = function(mode, lhs, rhs, opts)
      opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- AST-aware navigation
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, silent = true, desc = 'Go to Declaration' })
    vim.keymap.set('n', 'gd', "<cmd>lua vim.lsp.buf.definition({reuse_win=true})<CR>", { buffer = bufnr, silent = true, desc = 'Go to Definition' })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, silent = true, desc = 'Go to Implementation' })
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = bufnr, silent = true, desc = 'Open Diagnostic Float' })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, silent = true, desc = 'Find References' })
    vim.keymap.set("n", "gt", '<cmd>Telescope lsp_type_definitions<CR>', { buffer = bufnr, silent = true, desc = 'Type Definitions' })
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, { buffer = bufnr, silent = true, desc = 'Type Definition' })

    -- help
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, silent = true, desc = 'Hover' })
    vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, { buffer = bufnr, silent = true, desc = 'Signature Help' })

    -- navigation ---------------------------------------------------------

    -- ]d - Jump Next --
    vim.keymap.set(
      'n',
      ']d',
      function()
        vim.diagnostic.jump({ count = 1, severity = warn_plus, float = true })
      end,
      { buffer = bufnr, silent = true, desc = 'Previous Diagnostic' }
    )

    -- ]d - Jump Prev --
    vim.keymap.set(
      'n',
      '[d',
      function()
        vim.diagnostic.jump({ count = -1, severity = warn_plus, float = true })
      end,
      { buffer = bufnr, silent = true, desc = 'Previous Diagnostic' }
    )

    -- ,L - Set Loclist --
    vim.keymap.set('n', '<leader>L', vim.diagnostic.setloclist, { buffer = bufnr, silent = true, desc = 'Set Loclist' })

    -- ,dh - Hide Diagnostics --
    buf_set_keymap("n", "<leader>dh", "<cmd>lua vim.diagnostic.disable(0)<CR>", { desc = 'Hide Diagnostics' })

    -- ,dr - LspRestart --
    buf_set_keymap("n", "<leader>dr", "<cmd>LspRestart<CR>", { desc = 'Restart LSP' })

    -- ,ds - Show Diagnostics --
    buf_set_keymap("n", "<leader>ds", "<cmd>lua vim.diagnostic.enable(0)<CR>", { desc = 'Show Diagnostics' })

    -- refactoring
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, silent = true, desc = 'Rename Symbol' })
    vim.keymap.set('n', '<leader>dca', vim.lsp.buf.code_action, { buffer = bufnr, silent = true, desc = 'Code Action' })
  end,
})


-- Enable LSP servers (configs are auto-loaded from after/lsp/)
vim.lsp.enable('bashls')
vim.lsp.enable('eslint')
vim.lsp.enable('gopls')
vim.lsp.enable('jsonls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('ruff')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('tsserver')
-- vim.lsp.enable('ty')  -- disabled for now, needs to cook a little more
vim.lsp.enable('typst')
