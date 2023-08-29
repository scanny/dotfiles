--------------------------------------------------------------------------------------
-- split function args onto separate lines

return {
  "FooSoft/vim-argwrap",
  keys = {
    {
      "<leader>a",
      "<cmd>ArgWrap<CR>",
      { desc = "Split func args onto separate lines" },
    },
  },

  config = function ()
    -- last item in list gets comma too
    vim.g.argwrap_tail_comma = 1
  end
}
