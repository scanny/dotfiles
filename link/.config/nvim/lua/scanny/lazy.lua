--------------------------------------------------------------------------------------
-- Initialize lazy.nvim Neovim package manager

-- install lazy.nvim, only runs first time on new machine --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- trigger loading of other plugins --
require("lazy").setup(
  "scanny.plugins",
  {
    install = {
      colorscheme = { "gruvbox" },
    },
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    },
  }
)
