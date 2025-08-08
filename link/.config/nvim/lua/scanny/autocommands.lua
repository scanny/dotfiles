
local group

-- Auto-command to customize chat buffer behavior
group = vim.api.nvim_create_augroup("CopilotChatSettings", {clear = true})
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'copilot-*',
  callback = function()
    vim.opt.foldlevel = 2  -- don't collapse folds in new window --
    vim.opt_local.conceallevel = 0
  end,
  group = group,
})

-- FocusLost - automatically save all buffers after tabbing away from vim --
group = vim.api.nvim_create_augroup("OnLoseFocus", {clear = true})
vim.api.nvim_create_autocmd("FocusLost", { command = ":silent wall", group = group })


-- FocusGained - in conjunction with `set autoread`, automatically re-read
-- externally-changed file when focus is regained
group = vim.api.nvim_create_augroup("OnGainFocus", {clear = true})
vim.api.nvim_create_autocmd("FocusGained", { command = ":checktime", group = group })


-- ignore CR mapping (to :noh) in special windows like quickfix --
group = vim.api.nvim_create_augroup("NoCRMapInQuickfix", {clear = true})
vim.api.nvim_create_autocmd(
  "BufReadPost",
  {pattern="quickfix", command="nnoremap <buffer> <CR> <CR>", group=group}
)
-- same for command-line window --
vim.api.nvim_create_autocmd(
  "CmdwinEnter", { command="nnoremap <buffer> <CR> <CR>", group=group }
)
