--------------------------------------------------------------------------------------
-- navigate file tree in clean netrw style with "-" key

return {
  -- press "minus" key to show directory and navigate using netrw --
  "justinmk/vim-dirvish",
  config = function ()
    -- use short (relative to pwd) paths in Dirvish buffers --------------
    vim.g.dirvish_relative_paths = 1
  end
}
