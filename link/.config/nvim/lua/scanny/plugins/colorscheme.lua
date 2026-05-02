return {
  -- {
  --   'sainnhe/gruvbox-material',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.gruvbox_material_enable_italic = true
  --     vim.cmd.colorscheme('gruvbox-material')
  --   end
  -- }

  -- {
  --   'sainnhe/everforest',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.everforest_enable_italic = true
  --     vim.cmd.colorscheme('everforest')
  --   end
  -- }

  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
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
        terminal_colors = true,
        transparent_mode = false,
        undercurl = true,
        underline = true,
      })

      -- select dark or light based on time-of-day --
      vim.cmd [[ set background=dark ]]
      -- vim.cmd [[
      --   if strftime("%H") > 6 && strftime("%H") < 14
      --     set background=light
      --   else
      --     set background=dark
      --   endif
      -- ]]

      -- load the colorscheme --
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
