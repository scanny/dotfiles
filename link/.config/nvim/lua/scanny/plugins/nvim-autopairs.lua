--------------------------------------------------------------------------------------
-- auto-insert closing pairs for paren, brackets, quotes, etc.

return {
  "windwp/nvim-autopairs",
  dependencies = "hrsh7th/nvim-cmp",
  event = { "InsertEnter" },

  config = function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup {
      check_ts = true,
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      fast_wrap = {
        -- switch for basic rule break undo sequence
        break_undo = true,
        --
        chars = { "{", "[", "(", '"', "'" },
        --
        check_comma = true,
        --
        check_ts = false,
        -- disable when recording or executing a macro
        disable_in_macro = false,
        --
        disable_in_replace_mode = true,
        -- disable when insert after visual block mode
        disable_in_visualblock = false,
        -- trigger abbreviation
        enable_abbr = false,
        -- add bracket pairs after quote
        enable_afterquote = true,
        --
        enable_bracket_in_quote = true,
        -- check bracket in same line
        enable_check_bracket_line = true,
        --
        enable_moveright = true,
        --
        end_key = "$",
        --
        highlight = "PmenuSel",
        --
        highlight_grey = "LineNr",
        --
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
        -- map the <BS> key
        map_bs = true,
        --
        map_cr = true,
        -- Map the <C-h> key to delete a pair
        map_c_h = false,
        -- map <c-w> to delete a pair if possible
        map_c_w = false,
        --
        map = "<M-e>",
        --
        offset = 0, -- Offset from pattern match
        --
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        --
        keys = "qwertyuiopzxcvbnmasdfghjkl",
      },
      ts_config = {
        lua = { "string", "source" },
        javascript = { "string", "template_string" },
        java = false,
      },
    }

    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local cmp = require("cmp")

    -- make autopairs and completion work together
    cmp.event:on(
      "confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } }
    )

  end,
}
