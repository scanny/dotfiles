-- this template is borrowed from nvim-lspconfig
local on_windows = vim.loop.os_uname().version:match("Windows")

local function join_paths(...)
    local path_sep = on_windows and "\\" or "/"
    local result = table.concat({ ... }, path_sep)
    return result
end

vim.cmd([[set runtimepath=$VIMRUNTIME]])

local temp_dir
if on_windows then
    temp_dir = vim.loop.os_getenv("TEMP")
else
    temp_dir = "/tmp"
end

vim.cmd("set packpath=" .. join_paths(temp_dir, "nvim", "site"))

local package_root = join_paths(temp_dir, "nvim", "site", "pack")
local install_path = join_paths(package_root, "packer", "start", "packer.nvim")
local compile_path = join_paths(install_path, "plugin", "packer_compiled.lua")

local null_ls_config = function()
    local null_ls = require("null-ls")
    -- add only what you need to reproduce your issue
    null_ls.setup({
	diagnostics_format = "[#{c}] #{m} (#{s})",
        sources = {
		null_ls.builtins.diagnostics.mypy.with({
			extra_args = { "--strict", },
		}),
		null_ls.builtins.diagnostics.flake8,
	},
        debug = true,
    })
end

local function load_plugins()
    -- only add other plugins if they are necessary to reproduce the issue
    require("packer").startup({
        {
            "wbthomason/packer.nvim",
            {
                "jose-elias-alvarez/null-ls.nvim",
                requires = { "nvim-lua/plenary.nvim" },
                config = null_ls_config,
            },
        },
        config = {
            package_root = package_root,
            compile_path = compile_path,
        },
    })
end

if vim.fn.isdirectory(install_path) == 0 then
    vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
    load_plugins()
    require("packer").sync()
else
    load_plugins()
    require("packer").sync()
end

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local set = vim.opt

-- enable mouse in all modes ---
set.mouse = "chinv"

-- leader is comma ---
vim.g.mapleader = ","

-- sp - open horizontal split window ---
keymap("n", "<leader>sp", ":split<CR>", opts)

-- w - write current buffer ---
keymap("n", "<leader>w", ":write<CR>", opts)

-- v - vertical split ---
keymap("n", "<leader>v", ":vsplit<CR>", opts)

keymap("i", "jk", "<Esc>", opts)

-- Q - exit quickly when multiple windows are open (like quick-fix pane) --
keymap("n", "Q", ":qa<CR>", opts)

-- Ctrl+{movement} keys navigate between windows --
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-h>", "<C-w>h", opts)

-- require'null_ls'.setup({
--   sources = {
--     require'null_ls'.builtins.diagnostics.flake8,
--     require'null_ls'.builtins.diagnostics.mypy,
--   },
--   debug = true,
-- })
