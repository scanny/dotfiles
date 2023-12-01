return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,  -- make sure to load this before all the other start plugins

    config = function()
      local gruvbox = require("gruvbox")

      gruvbox.setup({
        bold = true,
        contrast = "", -- can be "hard", "soft" or empty string
        dim_inactive = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        invert_intend_guides = false,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        italic = { strings = true, operators = true, comments = true },
        overrides = {},
        palette_overrides = {},
        strikethrough = true,
        transparent_mode = false,
        undercurl = true,
        underline = true,
      })

      -- select dark or light based on time-of-day --
      vim.cmd [[
        if strftime("%H") > 6 && strftime("%H") < 15
          set background=light
        else
          set background=dark
        endif
      ]]

      -- load the colorscheme --
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
