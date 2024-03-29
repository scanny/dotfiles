--------------------------------------------------------------------------------------
-- Status line

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local gruvbox = require("lualine.themes.gruvbox")

    -- change middle color of inactive bar ---
    -- gruvbox.inactive.c.fg = "#ffffff"
    -- gruvbox.inactive.c.bg = "#ccbbaa"

    -- better file position segment ---
    local custom_location = "%-14.(ℓ %l/%L 𝚌 %-2c%)"

    lualine.setup({
        extensions = {"fugitive"},
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {"filename"},
            lualine_x = {custom_location},
            lualine_y = {},
            lualine_z = {}
        },
        options = {
            always_divide_middle = true,
            component_separators = { left = "", right = ""},
            disabled_filetypes = {},
            -- globalstatus = true,
            globalstatus = false,
            icons_enabled = true,
            section_separators = { left = "", right = ""},
            theme = gruvbox,
        },
        sections = {
            lualine_a = {"mode"},
            -- lualine_b = {"branch", "diff", "diagnostics"},
            -- lualine_b = {"branch"},
            lualine_b = {"branch", "diff", "selectioncount"},
            lualine_c = {
                {
                    "filename",
                    filestatus = true,
                    file_status = true,        -- (readonly status, modified status)
                    -- path = 1,                  -- 0: Just the filename
                    path = 0,                  -- 0: Just the filename
                                               -- 1: Relative path
                                               -- 2: Absolute path
                                               -- 3: Abspath, with tilde as home dir
                    shorting_target = 45,      -- spaces left for other components
                    symbols = {
                        -- modified = ' ●',       -- buffer is modified
                        modified = ' ⭕️',      -- buffer is modified
                        readonly = '[-]',      -- when file is non-modifiable or readonly
                        unnamed = '[No Name]', -- filename for unnamed buffers
                    }
                }
            },
            -- lualine_x = {"encoding", "fileformat", "filetype"},
            lualine_x = {{"filetype", icons_enabled=false}},
            -- lualine_y = {"progress"},
            lualine_y = {},
            -- lualine_z = {"location"}
            lualine_z = {custom_location},
        },
        tabline = {}
    })

  end,
}
