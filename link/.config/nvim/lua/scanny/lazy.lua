--------------------------------------------------------------------------------------
-- Initialize lazy.nvim Neovim package manager

-- install lazy.nvim, only runs first time on new machine --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Add lazy to the `runtimepath`, this allows us to `require` it.
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
    rocks = {
      enabled = false,
    }
  }
)
