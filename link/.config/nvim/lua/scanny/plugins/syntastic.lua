--------------------------------------------------------------------------------------
-- Old-school lint-on-save, keeping around for mypy

return {
  "scrooloose/syntastic",
  enabled = false,
  config = function()
    vim.g.syntastic_auto_loc_list = 1
    vim.g.syntastic_cursor_columns = 0
    vim.g.syntastic_echo_current_error = 0
    vim.g.syntastic_enable_baloons = 0
    vim.g.syntastic_enable_signs = 0
    vim.g.syntastic_mode_map = {mode="passive", passive_filetypes={"rst"}}
    vim.g.syntastic_python_checkers = {'flake8', 'mypy'}
    vim.g.syntastic_python_mypy_args = ""
    vim.g.syntastic_rst_checkers = {}

    local opts = { silent = true }

    -- ,dt - diagnostics-toggle ---
    vim.keymap.set("n", "<leader>dt", "<cmd>SyntasticToggleMode<CR>", opts)
  end,
}
