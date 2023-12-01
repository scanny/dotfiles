return {
  "nvim-telescope/telescope.nvim",
  -- branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    'nvim-telescope/telescope-dap.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
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
      },
      pickers = {
        buffers = {
          initial_mode = "normal",
          mappings = {
            i = {["<CR>"] = actions.select_drop},
            n = {["<CR>"] = actions.select_drop},
          },
        },
        diagnostics = {
          initial_mode = "normal",
          mappings = {
            i = {["<CR>"] = actions.select_drop},
            n = {["<CR>"] = actions.select_drop},
          },
        },
        find_files = {
          find_command = {
            "fd",
            "--type=f",
            "--ignore-file=.fdignore",
            "--strip-cwd-prefix",
          },
          hidden = false,
          no_ignore_vcs = true,
          mappings = {
            i = {["<CR>"] = actions.select_drop},
            n = {["<CR>"] = actions.select_drop},
          },
        },
        grep_string = {
          mappings = {
            i = {["<CR>"] = actions.select_drop},
            n = {["<CR>"] = actions.select_drop},
          },
        },
        live_grep_args = {
          mappings = {
            i = {["<CR>"] = actions.select_drop},
            n = {["<CR>"] = actions.select_drop},
          },
        },
        lsp_references = {
          fname_width = 75,
          initial_mode = "normal",
            i = {["<CR>"] = actions.select_drop},
            n = {["<CR>"] = actions.select_drop},
        },
      },
    }


    -- LOAD EXTENSIONS ---------------------

    telescope.load_extension("dap")
    telescope.load_extension("live_grep_args")


    -- TELESCOPE ---------------------------

    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- f/ - find-search - Telescope search-history
    keymap("n", "<leader>f/", "<cmd>Telescope search_history<cr>", opts)
    -- f: - find-commands - Telescope commands
    keymap("n", "<leader>f:", "<cmd>Telescope commands<CR>", opts)
    -- fb - find-buffer - Telescope buffers
    keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
    -- fc - find-command-history - Telescope command-history
    keymap("n", "<leader>fc", "<cmd>Telescope command_history<CR>", opts)
    -- fd - find-diagnostics - Telescope diagnostics (current-buffer)
    keymap(
      "n",
      "<leader>fd",
      ":lua require('telescope.builtin').diagnostics({bufnr=0})<CR>",
      opts
    )
    -- fD - find-diagnostics - Telescope diagnostics (all-buffers)
    keymap("n", "<leader>fD", "<cmd>Telescope diagnostics<CR>", opts)
    -- ff - find-files - Telescope file finder
    keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
    -- fg - find-grep - Telescope live_grep --
    -- keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
    keymap(
      "n",
      "<leader>fg",
      ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      opts
    )
    -- fh - find-help - Telescope live_grep --
    keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
    -- fi - find-identifier - grep identifier under cursor
    keymap("n", "<leader>fi", "<cmd>Telescope grep_string<CR>", opts)
    -- fk - find-keymaps - Telescope key mappings --
    keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)
    -- fs - find-symbol - Telescope symbols in buffer
    keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", opts)
    -- fuf - find-sense-files - find-files in sense repo --
    keymap("n", "<leader>fsf", "<cmd>lua require('telescope.builtin').find_files({cwd='/Users/scanny/SpacedOut/sense'})<cr>", opts)
    -- fug - grep-sense-files - Telescope live_grep sense repo --
    keymap("n", "<leader>fsg", "<cmd>lua require('telescope.builtin').live_grep({cwd='/Users/scanny/SpacedOut/sense'})<cr>", opts)
  end,
}
