return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    'nvim-telescope/telescope-dap.nvim',
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"

    telescope.setup {
      defaults = {

        layout_strategy = "vertical",

        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-c>"] = actions.close,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,

            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          },

          n = {
            ["<esc>"] = actions.close,
            ["<C-[>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,

            ["?"] = actions.which_key,
          },
        },

        path_display = { "truncate" },
        prompt_prefix = " ",
        selection_caret = " ",
      },
      extensions = {
        -- media_files = {
        --   -- filetypes whitelist
        --   -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        --   filetypes = {"png", "webp", "jpg", "jpeg"},
        --   find_cmd = "rg" -- find command (defaults to `fd`)
        -- }
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        lsp_references = {
          fname_width = 75,
        },
      },
    }


    -- LOAD EXTENSIONS ---------------------

    telescope.load_extension("dap")


    -- TELESCOPE ---------------------------

    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- f: - find-commands - Telescope commands
    keymap("n", "<leader>f:", "<cmd>Telescope commands<CR>", opts)
    -- fb - find-buffer - Telescope buffers
    keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
    -- fc - find-command-history - Telescope command-history
    keymap("n", "<leader>fc", "<cmd>Telescope command_history<CR>", opts)
    -- ff - find-files - Telescope file finder
    keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
    -- fg - find-grep - Telescope live_grep --
    keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
    -- fh - find-help - Telescope live_grep --
    keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
    -- fk - find-keymaps - Telescope key mappings --
    keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)
    -- f/ - find-search - Telescope search-history
    keymap("n", "<leader>f/", "<cmd>Telescope search_history<cr>", opts)
    -- fsf - find-sense-files - find-files in sense repo --
    keymap("n", "<leader>fsf", "<cmd>lua require('telescope.builtin').find_files({cwd='/Users/scanny/SpacedOut/sense'})<cr>", opts)
    -- fsg - grep-sense-files - Telescope live_grep sense repo --
    keymap("n", "<leader>fsg", "<cmd>lua require('telescope.builtin').live_grep({cwd='/Users/scanny/SpacedOut/sense'})<cr>", opts)
  end,
}
