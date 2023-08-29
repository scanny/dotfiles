return {
  "hrsh7th/nvim-cmp",  -- The completion plugin
  dependencies = {
    "hrsh7th/cmp-buffer",                   -- buffer completions
    "hrsh7th/cmp-cmdline",                  -- cmdline completions
    "hrsh7th/cmp-nvim-lsp",                 -- LSP completions
    "hrsh7th/cmp-nvim-lsp-signature-help",  -- function signatures
    "hrsh7th/cmp-nvim-lua",                 -- Neovim's Lua runtime API (e.g. vim.*)
    "hrsh7th/cmp-path",                     -- path completions
    "saadparwaiz1/cmp_luasnip",             -- Suggest LuaSnip completions
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  -- Needs to be running for cmdline completion right from get-go --
  -- event = "InsertEnter",

  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    -- cot - completion options menu,menuone,noselect,longesst,preview,noinsert,noselect
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    --   פּ ﯟ   some good icons
    -- find more here: https://www.nerdfonts.com/cheat-sheet
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

    -- global setup --
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
            buffer = '[buf]',
            nvim_lsp = '[LSP]',
            nvim_lua = '[api]',
            path = '[path]',
            luasnip = '[snip]',
          })[entry.source.name]
          return vim_item
        end,
      },

      mapping = {
        ["<Tab>"] = cmp.mapping.select_next_item {
          behavior = cmp.SelectBehavior.Insert
        },
        ["<C-p>"] = cmp.mapping.select_prev_item {
          behavior = cmp.SelectBehavior.Insert
        },
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
        ["<C-space>"] = cmp.mapping.complete(),
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- completions are prioritized according to the order of these sources --
      sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp', max_item_count = 5 },
        { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 3 },
      },
    }

    -- `/` (search) cmdline setup.
    cmp.setup.cmdline( { '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer', keyword_length = 3 }
      }
    })

    -- `:` (command) cmdline setup.
    cmp.setup.cmdline(':', {
      -- avoid a mile-long list of suggested completions for a command like "3,4t." --
      enabled = function ()
        return not string.match(vim.fn.getcmdline(), "^%d")
      end,

      -- cmp.mapping.preset.cmdline() doesn't play nicely with my <C-p/n> mapping for
      -- getting previous and next matching prefix from command history because it
      -- defines <C-p> and <C-n>. Redefine mappings leaving those out.
      mapping = {
        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })
        ),
      },

      sources = {
        { name = 'path', keyword_length = 5 },
        { name = 'cmdline', keyword_length = 5 },
      },
    })

  end,
}
