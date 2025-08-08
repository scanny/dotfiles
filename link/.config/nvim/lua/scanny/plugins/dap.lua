--------------------------------------------------------------------------------------
-- Debug Adapter Protocol (DAP) configuration (multi-plugin)

return {
  'mfussenegger/nvim-dap',
  enabled = true,

  dependencies = {
    "mfussenegger/nvim-dap-python",
    "rcarriga/nvim-dap-ui",
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',
    'nvim-neotest/nvim-nio',
  },

  config = function ()
    local dap = require("dap")
    local dap_python = require("dap-python")
    local dapui = require("dapui")

    -- dap-ui setup ------------------------------------------------------------

    dapui.setup()
    dap.listeners.before.attach.dapui_config = function ()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function ()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function ()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function ()
      dapui.close()
    end

    -- dap-python setup --------------------------------------------------------

    dap_python.setup("~/.virtualenvs/nvim/bin/python")
    dap_python.test_runner = "pytest"

    -- dap-virtual-text setup --------------------------------------------------

    require("nvim-dap-virtual-text").setup {
        enabled = true,                        -- enable this plugin (the default)
        enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true,               -- show stop reason when stopped for exceptions
        commented = false,                     -- prefix virtual text with comment string
        only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
        all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
        clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
        --- A callback that determines how a variable is displayed or whether it should be omitted
        --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
        --- @param buf number
        --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
        --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
        --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
        --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
        display_callback = function(variable, buf, stackframe, node, options)
          -- by default, strip out new line characters --
          if options.virt_text_pos == 'inline' then
            return ' = ' .. variable.value:gsub("%s+", " ")
          else
            return variable.name .. ' = ' .. variable.value:gsub("%s+", " ")
          end
        end,
        -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
        virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

        -- experimental features:
        all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                               -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
    }

    -- DAP key bindings --------------------------------------------------------

    -- eval var under cursor --
    vim.keymap.set("n", "<leader>d?", function()
      ---@diagnostic disable-next-line: missing-fields
      require("dapui").eval(nil, { enter = true })
    end)

    -- F3 for step-by-step, right for deeper in, left for out
    vim.keymap.set("n", "<F1>", ":lua require'dap'.step_back()<CR>")
    vim.keymap.set("n", "<F2>", ":lua require'dap'.step_out()<CR>")
    vim.keymap.set("n", "<F3>", ":lua require'dap'.step_over()<CR>")
    vim.keymap.set("n", "<F4>", ":lua require'dap'.step_into()<CR>")
    vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")

    vim.keymap.set("n", "<leader>B", ":lua require'dap'.toggle_breakpoint()<CR>")
    vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>")
    vim.keymap.set("n", '<leader>df', ":Telescope dap frames<CR>")
    vim.keymap.set("n", "<leader>di", ":lua require'dap'.step_into()<CR>")
    vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_over()<CR>")
    vim.keymap.set("n", "<leader>dt", ":lua require'dap-python'.test_method()<CR>")
    vim.keymap.set("n", "<leader>du", ":lua require'dap'.step_out()<CR>")
    -- vim.keymap.set("n", "<leader>db", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
    -- vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
    -- vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
    -- vim.keymap.set("n", '<leader>dv', ":lua require'dap.ui.widgets'.hover()<CR>")

  end

}
