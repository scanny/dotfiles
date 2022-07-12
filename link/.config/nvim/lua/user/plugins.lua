-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)

    -- Packer can manage itself --
    use "wbthomason/packer.nvim"
    --- common dependencies --
    use "nvim-lua/popup.nvim"   -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

    -- 'Black'-ens Python code on save --
    use {"psf/black", tag="19.10b0"}

    -- status line --
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt=true}
    }

    -- provides Solarized color scheme --
    use "ishan9299/nvim-solarized-lua"

    -- Tab naming --
    use "gcmt/taboo.vim"

    -- Treesitter --
    use {"nvim-treesitter/nvim-treesitter", run=":TSUpdate"}

    -- Telescope --
    use "nvim-telescope/telescope.nvim"

    -- jump around git and merge conflicts ---
    use "wincent/vcs-jump"

    -- more powerful camel/snake-case aware text substitution with :S instead of :s --
    use "tpope/vim-abolish"

    -- provides filetype-aware code commenting ---
    use "tpope/vim-commentary"

    -- press "minus" key to show directory and navigate using netrw --
    use "justinmk/vim-dirvish"

    -- allows renames etc. on a buffer and its file ---
    use "tpope/vim-eunuch"

    -- git integration --
    use "tpope/vim-fugitive"

    -- toggle maximize current split ---
    use "szw/vim-maximizer"

    -- store dynamically updated session files ---
    use "tpope/vim-obsession"

    -- repeat plugin actions with "." command --
    use "tpope/vim-repeat"

    -- horizontal find with 2-letters --
    use "justinmk/vim-sneak"

    -- write better buffer persistance (view) files --
    use "zhimsel/vim-stay"

    -- enable changing surrounding pairs like quotes in single action ---
    use "tpope/vim-surround"

    -- handy bracket mappings like "]q" for :cnext ---
    use "tpope/vim-unimpaired"


    -- ==== COMPLETION =================================================

    use "hrsh7th/nvim-cmp"                -- The completion plugin
    use "hrsh7th/cmp-buffer"              -- buffer completions
    use "hrsh7th/cmp-path"                -- path completions
    use "hrsh7th/cmp-cmdline"             -- cmdline completions
    use "saadparwaiz1/cmp_luasnip"        -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"            -- LSP completions
    use "hrsh7th/cmp-nvim-lua"            -- Neovim's Lua runtime API (e.g. vim.*)


    -- ==== SNIPPETS ===================================================

    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- ==== LANGUAGE SERVER PROTOCOL (LSP) =============================
    use "neovim/nvim-lspconfig"           -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "jose-elias-alvarez/null-ls.nvim" -- LSP-ifies CLI linters etc.

end)
