if not pcall(require, "luasnip") then
  return
end

local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local types = require "luasnip.util.types"

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = false,

  -- Deleting a snippet that was still editable can cause wonky auto-insertion of text
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
}

-- load from rafamadriz/friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- add a Python snippet
ls.add_snippets(
  "python",
  {
    -- parameters for a pytest test-method
    s("par",
      fmt("@pytest.mark.parametrize(\n    \"{}\",\n    (\n"
          ..  "        # -DELETEME--------------------------------------------------"
          ..  "-------------\n        (),\n    )\n)",
          { i( 1, "params") }
      )
    ),

    -- print formatted
    s("prf",
      fmt("print(f\"{} == {{{}}}\")", { i( 1, "value"), rep(1) })
    ),

    -- raise NotImplementedError
    s("rni", { t({"raise NotImplementedError"}) }),

    -- XFAIL decorator on pytest test-method
    s(
      "xf",
      { t({"@pytest.mark.xfail(reason=\"WIP\", raises=NotImplementedError,"
            .. " strict=True)" }) }
    )
  }
)

--for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/tj/snips/ft/*.lua", true)) do
--  loadfile(ft_path)()
--end

---- <c-k> is my expansion key
---- this will expand the current item or jump to the next item within the snippet.
--vim.keymap.set({ "i", "s" }, "<c-k>", function()
--  if ls.expand_or_jumpable() then
--    ls.expand_or_jump()
--  end
--end, { silent = true })

---- <c-j> is my jump backwards key.
---- this always moves to the previous item within the snippet
--vim.keymap.set({ "i", "s" }, "<c-j>", function()
--  if ls.jumpable(-1) then
--    ls.jump(-1)
--  end
--end, { silent = true })

---- <c-l> is selecting within a list of options.
---- This is useful for choice nodes (introduced in the forthcoming episode 2)
--vim.keymap.set("i", "<c-l>", function()
--  if ls.choice_active() then
--    ls.change_choice(1)
--  end
--end)

--vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")

---- shorcut to source my luasnips file again, which will reload my snippets
--vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
