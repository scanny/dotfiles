return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting

      textobjects = {

        lspinterop = {
          enable = true,
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
          },
        },

        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer.start",
            ["]]"] = { query = "@class.outer", desc = "Next class start" },
          },
          goto_previous_start = {
            ["[f"] = "@function.outer.start",
            ["[["] = "@class.outer",
          },
        },

        -- Select, change, delete targets, like `Vaf` for line-select a function.
        select = {
          enable = true,

          -- Scan forward to the next textobj if not in one, similar to targets.vim --
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer.start",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            -- You can optionally set descriptions to the mappings (used in the desc
            -- parameter of nvim_buf_set_keymap) which plugins like which-key display
            ["ic"] = {
              query = "@class.inner",
              desc = "Select inner part of a class region",
            },
            -- You can also use captures from other query groups like `locals.scm`
            ["as"] = {
              query = "@scope",
              query_group = "locals",
              desc = "Select language scope",
            },
          },

          -- You can choose the select mode (default is charwise 'v')
          --
          -- This does not apply to select, which uses the v, V or <C-v> in the select
          -- command to determine mode.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer.start'] = 'v',
            ['@class.outer'] = 'V',
          },

          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true of false
          include_surrounding_whitespace = true,
        },

        -- exchange current textobj with next or previous of its kind --
        swap = {
          enable = true,
          swap_previous = {
            ["<leader>su"] = "@function.outer.start",
          },
          swap_next = {
            ["<leader>sd"] = "@function.outer.start",
          },
        },
      },

    })

   local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

   -- Repeat movement with ; and ,
   vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
   vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

   -- ensure ; goes forward and , goes backward regardless of the last direction
   -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
   -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

   -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
   vim.keymap.set({ "n", "x"      }, "f", ts_repeat_move.builtin_f)
   vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
   vim.keymap.set({ "n", "x",     }, "t", ts_repeat_move.builtin_t)
   vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)

  end,

}
