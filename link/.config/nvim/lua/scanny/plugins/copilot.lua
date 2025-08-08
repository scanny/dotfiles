return {
	"github/copilot.vim",
	-- enabled = true,
	config = function()
		local keymap = vim.api.nvim_set_keymap

		keymap("i", "<C-j>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
		keymap("i", "<C-l>", 'copilot#AcceptWord("\\<CR>")', { expr = true, replace_keycodes = false })
		vim.g.copilot_no_tab_map = true
		-- local copilot = require "copilot"

		-- copilot.setup {
		--   suggestion = { enabled = false },
		--   -- panel = { enabled = false },
		--   filetypes = {
		--     lua = true,
		--     python = true,
		--     help = true,
		--   },
		-- }
	end,
}
