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
    change_detection = {
      notify = false,
    },
    checker = {
      enabled = true,
      notify = false,
    },
    dev = {
      -- directory local plugin projects are stored --
      path = "~/Dropbox/src",
      -- @type string[] plugins that match these patterns will use your local versions
      -- instead of being fetched from GitHub
      patterns = {}, -- For example {"folke"}
      fallback = false, -- Fallback to git when local plugin doesn't exist
    },
    install = {
      colorscheme = { "gruvbox" },
    },
  }
)
