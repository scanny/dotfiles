-- Configuration for syntastic plugin

vim.g.syntastic_auto_loc_list = 1
vim.g.syntastic_cursor_columns = 0
vim.g.syntastic_echo_current_error = 0
vim.g.syntastic_enable_baloons = 0
vim.g.syntastic_enable_signs = 0
vim.g.syntastic_mode_map = {mode="active", passive_filetypes={"rst"}}
vim.g.syntastic_python_checkers = {'flake8', 'mypy'}
vim.g.syntastic_python_mypy_args = ""
vim.g.syntastic_rst_checkers = {}


local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- ,dt - diagnostics-toggle ---
keymap("n", "<leader>dt", "<cmd>SyntasticToggleMode<CR>", opts)


-- Just in case my lua-fu isn't quite right --
--
-- vim.cmd [[
--   let g:syntastic_auto_loc_list = 1
--   let g:syntastic_cursor_columns = 0
--   let g:syntastic_echo_current_error = 0
--   let g:syntastic_enable_baloons = 0
--   let g:syntastic_enable_signs = 0
--   let g:syntastic_mode_map = {"mode": "active", "passive_filetypes": ["rst"]}
--   let g:syntastic_python_checkers = ['flake8', 'mypy']
--   let g:syntastic_python_mypy_args = ""
--   let g:syntastic_rst_checkers = []
-- ]]
