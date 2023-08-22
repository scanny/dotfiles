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
  vim.cmd([[packadd packer.nvim]])
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
    -- use "nvim-lua/popup.nvim"   -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

    -- === COMPLETION ==========================================================

    ---- modern completion ---
    use "hrsh7th/nvim-cmp"                     -- The completion plugin
    use "hrsh7th/cmp-buffer"                   -- buffer completions
    use "hrsh7th/cmp-path"                     -- path completions
    use "hrsh7th/cmp-cmdline"                  -- cmdline completions
    use "hrsh7th/cmp-nvim-lsp"                 -- LSP completions
    use "hrsh7th/cmp-nvim-lua"                 -- Neovim's Lua runtime API (e.g. vim.*)
    use "hrsh7th/cmp-nvim-lsp-signature-help"  -- function signatures
    use "saadparwaiz1/cmp_luasnip"             -- Suggest LuaSnip completions


    -- ==== SNIPPETS ===========================================================

    -- use 'SirVer/ultisnips'
    -- use 'honza/vim-snippets'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- ==== LANGUAGE SERVER PROTOCOL (LSP) =====================================

    use "neovim/nvim-lspconfig"              -- enable LSP

    -- lints on every save ---
    use 'scrooloose/syntastic'

    -- === FUZZY FINDING / SEARCH / FILE NAVIGATION ============================

    -- Telescope --
    use "nvim-telescope/telescope.nvim"

    -- press "minus" key to show directory and navigate using netrw --
    use "justinmk/vim-dirvish"


    -- === COLORSCHEMES ========================================================

    -- gruvbox color scheme ---
    use 'ellisonleao/gruvbox.nvim'


    -- === STATUS LINE =========================================================

    -- status line --
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt=true}
    }


    -- === TREESITTER ==========================================================

    -- provides AST-aware highlighting, folding, and indent --
    use {"nvim-treesitter/nvim-treesitter", run=":TSUpdate"}
    use "nvim-treesitter/playground"
    use "nvim-treesitter/nvim-treesitter-context"


    -- === TERMINAL ============================================================

    -- bring up floating terminal window without leaving vim --
    use "akinsho/toggleterm.nvim"


    -- === DEBUG ADAPTER PROTOCOL (DAP) SUPPORT ================================

    -- DAP support for neovim ---
    use {
      'mfussenegger/nvim-dap',
      requires = {
        'theHamsta/nvim-dap-virtual-text',
        'nvim-telescope/telescope-dap.nvim',
      }
    }
    use 'mfussenegger/nvim-dap-python'
    use {'rcarriga/nvim-dap-ui', requires = {"mfussenegger/nvim-dap"} }


    -- === LANGUAGE SUPPORT ====================================================

    -- provides Cucumber language syntax and folding ---
    use 'tpope/vim-cucumber'

    -- Golang support ---
    use 'fatih/vim-go'

    -- better indent behavior after colon etc. on Python --
    use 'Vimjas/vim-python-pep8-indent'


    -- === GIT =================================================================

    -- git integration --
    use "tpope/vim-fugitive"

    -- jump to github page for current file, commit, etc. --
    use "tpope/vim-rhubarb"

    -- show +/- in buffer --
    -- use "lewis6991/gitsigns.nvim"

    -- jump around git and merge conflicts --
    use "wincent/vcs-jump"


    -- === EDITING =============================================================

    -- 'Black'-ens Python code on save --
    use {"psf/black", tag="19.10b0"}

    -- better highlighting of search matches --
    use 'wincent/loupe'

    -- more powerful camel/snake-case aware text substitution with :S instead of :s --
    use "tpope/vim-abolish"

    -- split args onto separate lines ---
    use 'FooSoft/vim-argwrap'

    -- improved '*' search-under-cursor behaviors ---
    use 'haya14busa/vim-asterisk'

    -- provides filetype-aware code commenting --
    use "tpope/vim-commentary"

    -- allows renames etc. on a buffer and its file --
    use "tpope/vim-eunuch"

    -- highlight individual lines ---
    use 'airblade/vim-highline'

    -- Letters instead of numbers for relative lines ---
    use 'skamsie/vim-lineletters'

    -- toggle maximize current split --
    use 'szw/vim-maximizer'

    -- store dynamically updated session files --
    use 'tpope/vim-obsession'

    -- repeat plugin actions with '.' command --
    use 'tpope/vim-repeat'

    -- horizontal find with 2-letters --
    use 'justinmk/vim-sneak'

    -- write better buffer persistance (view) files --
    use 'zhimsel/vim-stay'

    -- enable changing surrounding pairs like quotes in single action --
    use 'tpope/vim-surround'

    -- add text object for segment (like "bar" in foo_bar_baz) in a variable --
    use {
      'Julian/vim-textobj-variable-segment',
      requires = { "kana/vim-textobj-user" },
    }

    -- handy bracket mappings like ']q' for :cnext --
    use 'tpope/vim-unimpaired'


    -- === EDITING =============================================================

    -- vimwiki - note-taking, HTML generation, document tree, etc. --
    use "vimwiki/vimwiki"

end)
