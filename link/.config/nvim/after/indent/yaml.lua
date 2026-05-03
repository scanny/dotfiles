-- indentation settings need to happen after default indent is loaded, ftplugin is too soon --
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
