local cmp = require('cmp')

local check_backspace = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Class = '',
  Color = '',
  Constant = '',
  Constructor = '',
  Enum = '',
  EnumMember = '',
  Event = '',
  Field = '',
  File = '',
  Folder = '',
  Function = '',
  Interface = '',
  Keyword = '',
  Method = 'm',
  Module = '',
  Operator = '',
  Property = '',
  Reference = '',
  Snippet = '',
  Struct = '',
  Text = '',
  TypeParameter = '',
  Unit = '',
  Value = '',
  Variable = '',
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
      vim_item.menu = ({
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        -- nvim_lua = '[LUA]',
        path = '[Path]',
        ultisnips = '[Snippet]',
      })[entry.source.name]
      return vim_item
    end,
  },
  mapping = {
    -- command-mode mappings --
    -- ['<C-p>'] = cmp.mapping(function(fallback) end, { 'c' }),
    -- ['<C-n>'] = cmp.mapping(cmp.mapping.disable, { 'c' }),
    -- ['<C-p>'] = cmp.mapping(cmp.mapping.disable, { 'c' }),
    -- ['<C-p>'] = cmp.mapping { 'c' = cmp.config.disable },
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'c' }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'c' }),
    -- ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
    -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
    -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-y>'] = cmp.mapping(cmp.mapping.confirm(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    -- ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- elseif luasnip.expandable() then
      --   luasnip.expand()
      -- elseif luasnip.expand_or_jumpable() then
      --   luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, {
    --   'i',
    --   's',
    -- }),
  },
  snippet = {
    expand = function(args)
      vim.fn['UltiSnips#Anon'](args.body)
    end,
  },
  sources = {
    { name = 'ultisnips' },
    -- { name = 'luasnip' },
    { name = 'nvim_lsp' },
    -- { name = 'nvim_lua' },
    { name = 'buffer', keyword_length = 4 },
    { name = 'path' },
  },
  -- view = {
  --   entries = native,
  -- },
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  },
}

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
  -- mapping = cmp.mapping.preset.cmdline(),
  -- adapted from cmp.mapping.preset.cmdline -- preset cmdline-mode configuration.
  mapping = {
    ['<Tab>'] = { c = function() cmp.select_next_item() end },
    ['<S-Tab>'] = { c = function() cmp.select_prev_item() end },
    ['<C-e>'] = { c = cmp.mapping.close() },
  },
  sources = {
    { name = 'buffer' }
  }
})

-- `:` cmdline setup.
cmp.setup.cmdline(
  ':',
  {
    -- adapted from cmp.mapping.preset.cmdline -- preset cmdline-mode configuration.
    mapping = {
      ['<Tab>'] = { c = function() cmp.select_next_item() end },
      ['<S-Tab>'] = { c = function() cmp.select_prev_item() end },
      ['<C-e>'] = { c = cmp.mapping.close() },
    },
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'cmdline' },
    })
  }
)
