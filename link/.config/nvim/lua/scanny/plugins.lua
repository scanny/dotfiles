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
    -- use "nvim-lua/popup.nvim"   -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

    -- === COMPLETION ==========================================================

    -- (legacy) completion ---
    -- use {'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins' }
    -- use 'davidhalter/jedi-vim'

    -- modern completion ---
    use "hrsh7th/nvim-cmp"                     -- The completion plugin
    use "hrsh7th/cmp-buffer"                   -- buffer completions
    use "hrsh7th/cmp-path"                     -- path completions
    use "hrsh7th/cmp-cmdline"                  -- cmdline completions
    use 'quangnguyen30192/cmp-nvim-ultisnips'  -- UltiSnips completions
    -- use "saadparwaiz1/cmp_luasnip"          -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"                 -- LSP completions
    -- use "hrsh7th/cmp-nvim-lua"              -- Neovim's Lua runtime API (e.g. vim.*)


    -- ==== SNIPPETS ===========================================================

    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'

    -- use "L3MON4D3/LuaSnip"                --snippet engine
    -- use "rafamadriz/friendly-snippets"    -- a bunch of snippets to use
    --

    -- ==== LANGUAGE SERVER PROTOCOL (LSP) =====================================

    use "neovim/nvim-lspconfig"              -- enable LSP

    -- lints on every save ---
    use 'scrooloose/syntastic'


    -- === FUZZY FINDING =======================================================

    -- Telescope --
    use "nvim-telescope/telescope.nvim"


    -- === COLORSCHEMES ========================================================

    -- gruvbox color scheme ---
    use 'ellisonleao/gruvbox.nvim'

    -- kinder, gentler gruvbox ---
    use 'sainnhe/gruvbox-material'

    -- provides Solarized color scheme ---
    use 'overcache/NeoSolarized'

    -- provides Solarized color scheme --
    use "ishan9299/nvim-solarized-lua"


    -- === TREESITTER ==========================================================

    -- provides AST-aware highlighting, folding, and indent --
    use {"nvim-treesitter/nvim-treesitter", run=":TSUpdate"}
    use "nvim-treesitter/playground"


    -- === LANGUAGE SUPPORT ====================================================

    -- Python syntax ---
    use 'vim-python/python-syntax'

    -- Efficient code folding for Python, which is a hard case because of sig-space ---
    use 'Konfekt/FastFold'
    use 'tmhedberg/SimpylFold'

    -- reStructuredText support ---
    use 'gu-fan/riv.vim'

    -- provides Cucumber language syntax and folding ---
    use 'tpope/vim-cucumber'

    -- JSON language support ---
    use 'elzr/vim-json'

    -- markdown (plasticboy) ---
    use 'plasticboy/vim-markdown'

    -- better indent behavior after colon etc. on Python --
    use 'Vimjas/vim-python-pep8-indent'

    -- XML ---
    use 'sukima/xmledit'


    -- === EDITING =============================================================

    -- 'Black'-ens Python code on save --
    use {"psf/black", tag="19.10b0"}

    -- rip-grep in Vim; multi-file search ---
    -- NOTE: installing ferret causes `E471: Argument required` error unless its :Black
    -- command is remapped (conflicts with Python Black command).
    use 'wincent/ferret'

    -- lightweight status line ---
    use 'itchyny/lightline.vim'

    -- status line --
    -- use {
    --     'nvim-lualine/lualine.nvim',
    --     requires = {'kyazdani42/nvim-web-devicons', opt=true}
    -- }

    -- better highlighting of search matches ---
    use 'wincent/loupe'

    -- provides quick-fix window behavior improvements ---
    use 'yssl/QFEnter'

    -- Tab naming --
    use "gcmt/taboo.vim"

    -- jump around git and merge conflicts --
    use "wincent/vcs-jump"

    -- more powerful camel/snake-case aware text substitution with :S instead of :s --
    use "tpope/vim-abolish"

    -- split args onto separate lines ---
    use 'FooSoft/vim-argwrap'

    -- improved '*' search-under-cursor behaviors ---
    use 'haya14busa/vim-asterisk'

    -- provides filetype-aware code commenting --
    use "tpope/vim-commentary"

    -- press "minus" key to show directory and navigate using netrw --
    use "justinmk/vim-dirvish"

    -- automatically choose right asynchronous 'compiler' for make ---
    use 'tpope/vim-dispatch'

    -- allows renames etc. on a buffer and its file --
    use "tpope/vim-eunuch"

    -- git integration --
    use "tpope/vim-fugitive"

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

    -- handy bracket mappings like ']q' for :cnext --
    use 'tpope/vim-unimpaired'

end)
