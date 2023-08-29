--------------------------------------------------------------------------------------
-- Snippets written in native lua

return {
  "L3MON4D3/LuaSnip",
  enabled = true,
  lazy = true,

  config = function ()
    local ls = require("luasnip")

    local s = ls.snippet
    local i = ls.insert_node
    local t = ls.text_node
    local fmt = require("luasnip.extras.fmt").fmt
    local rep = require("luasnip.extras").rep

    local types = require "luasnip.util.types"

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

  end,
}
