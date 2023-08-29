--------------------------------------------------------------------------------------
-- Load merge-conflicts into quickfix list

return {
  "wincent/vcs-jump",
  enabled = true,
  config = function()
    -- ,d - clear <leader>d set by VcsJump plugin ---
    vim.keymap.del("n", "<leader>d")
  end,
}
