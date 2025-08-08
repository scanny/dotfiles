
-- cot - completion options menu,menuone,noselect,longesst,preview,noinsert,noselect
vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.shortmess:append "c"


-- ============================================================= --
-- CMP (nvim-cmp)
-- ============================================================= --

local cmp = require('cmp')
local lspkind = require("lspkind")

cmp.setup {

  -- completions are prioritized according to the order of these sources --
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 3 },
  },

  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),
    ["<C-space>"] = cmp.mapping.complete(),
  },

  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require "cmp-under-comparator".under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol",
      maxwidth = 50,
      ellipsis_char = "...",
      show_labelDetails = true,
    })
  }

}

-- ============================================================= --
-- LUASNIP
-- ============================================================= --

local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local types = require "luasnip.util.types"

---@diagnostic disable-next-line undefined-field
ls.config.set_config({
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection.
  history = false,

  -- Deleting a snippet that was still editable can cause wonky auto-insertion of
  -- text.
  region_check_events = "InsertEnter",

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets: (not sure what these are)
  enable_autosnippets = false,

  -- Crazy highlights!!
  -- #vid3
  -- ext_opts = nil,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " « ", "NonTest" } },
      },
    },
  },
})

-- load from rafamadriz/friendly-snippets --
require("luasnip.loaders.from_vscode").lazy_load()

-- add some Python snippets --
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
ls.add_snippets(
  "python",
  {
    -- parameters for a pytest test-method
    s("par",
      fmt("@pytest.mark.parametrize(\n    \"{}\",\n    [\n"
          ..  "        # -DELETEME--------------------------------------------------"
          ..  "-------------\n        (),\n    ]\n)",
          { i( 1, "params") }
      )
    ),

    -- ----------------------------------------------------------------------------
    -- UNSAFE in luasnip, because it is short-lived. After it is deleted, random
    -- text is copied and placed where it used to be, very odd and disturbing. So
    -- don't make snippets that use dynamic-repetition that are temporary like this
    -- one and frequently deleted.
    -- ----------------------------------------------------------------------------
    -- print formatted
    -- s("prf",
    --   fmt("print(f\"{} == {{{}}}\")", { i( 1, "value"), rep(1) })
    -- ),

    -- # pyright: ingore[reportAssignmentType]
    s("prat", { t({" # pyright: ignore[reportAssignmentType]"}) }),

    -- # print(f"{}")
    s("prf", { t({"print(f\"{}\")"}) }),

    -- # pyright: ingore[reportGeneralTypeIssues]
    s("primo", { t({" # pyright: ignore[reportIncompatibleMethodOverride]"}) }),

    -- # pyright: ingore[reportPrivateUsage]
    s("prpu", { t({" # pyright: ignore[reportPrivateUsage]"}) }),

    -- # pytest.fail("WiP Inspection")
    s("ptf", { t({"pytest.fail(\"WIP Inspection\")"}) }),

    -- # with pytest.raises(ValueError, match="foobar"):
    s("ptr", { t({"with pytest.raises(ValueError, match=\"foobar\"):"}) }),

    -- raise NotImplementedError
    s("rni", { t({"raise NotImplementedError"}) }),

    -- # pyright: reportPrivateUsage=false
    s("rpu", { t({"# pyright: reportPrivateUsage=false"}) }),

    -- XFAIL decorator on pytest test-method
    s(
      "xf",
      { t({"@pytest.mark.xfail(reason=\"WIP\", raises=NotImplementedError,"
            .. " strict=True)" }) }
    )
  }
)
