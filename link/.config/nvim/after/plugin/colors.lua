
-- gruvbox Color Scheme ------------------

-- -- setup must be called before loading the colorscheme
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    operators = true,
    comments = true
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})------------------------------------

-- select dark or light based on time-of-day --
vim.cmd [[
  if strftime("%H") > 7 && strftime("%H") < 16
      set background=light
  else
      set background=dark
  endif
]]


vim.cmd('colorscheme gruvbox')
