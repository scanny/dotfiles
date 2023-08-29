--------------------------------------------------------------------------------------
-- open persistent terminal in popup window

return {
  "akinsho/toggleterm.nvim",

  config = function ()
    local toggleterm = require('toggleterm')

    toggleterm.setup({
        close_on_exit = true,
        direction = "float",
        float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
        hide_numbers = true,
        insert_mappings = true,
        open_mapping = [[<C-T>]],
        persist_size = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        shell = vim.o.shell,
        size = 20,
        start_in_insert = true,
    })

    function _G.set_terminal_keymaps()
      local opts = {noremap = true}
      vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

    local Terminal = require("toggleterm.terminal").Terminal

    local python = Terminal:new({ cmd = "python", hidden = true })

    function _PYTHON_TOGGLE()
        python:toggle()
    end

  end
}
