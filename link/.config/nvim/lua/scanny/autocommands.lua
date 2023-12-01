
local group

-- FocusLost - automatically save all buffers after tabbing away from vim --
group = vim.api.nvim_create_augroup("OnLoseFocus", {clear = true})
vim.api.nvim_create_autocmd("FocusLost", { command = ":silent wall", group = group })


-- FocusGained - in conjunction with `set autoread`, automatically re-read
-- externally-changed file when focus is regained
group = vim.api.nvim_create_augroup("OnGainFocus", {clear = true})
vim.api.nvim_create_autocmd("FocusGained", { command = ":checktime", group = group })


-- ignore CR mapping (to :noh) in special windows like quickfix --
group = vim.api.nvim_create_augroup("NoCRMapInQuickfix", {clear = true})
vim.api.nvim_create_autocmd(
  "BufReadPost",
  {pattern="quickfix", command="nnoremap <buffer> <CR> <CR>", group=group}
)
-- same for command-line window --
vim.api.nvim_create_autocmd(
  "CmdwinEnter", { command="nnoremap <buffer> <CR> <CR>", group=group }
)


-- ===================================================================
-- FILETYPE settings
-- ===================================================================


-- bash ----------------------------------------------------
group = vim.api.nvim_create_augroup("BashFileType", {clear = true})
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern="sh",
    command="set fde=nvim_treesitter#foldexpr() fdm=expr fdn=1 nowrap so=3 tw=88",
    group=group
  }
)


vim.cmd [[

" Cucumber file settings ---------------
augroup filetype_cucumber
    autocmd!
    autocmd FileType cucumber setlocal fdm=indent sw=2
augroup END

]]


-- Git commit ----------------------------------------------
group = vim.api.nvim_create_augroup("GitCommitFileType", {clear = true})
-- cc = colorcolumn, fo = formatoptions, tw = textwidth 
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern="gitcommit",
    command="set cc=73 fo+=t sts=4 sw=4 ts=4 tw=72",
    group=group,
  }
)


-- go ------------------------------------------------------
group = vim.api.nvim_create_augroup("GolangFileType", {clear = true})
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "go",
    command = (
      "setl noet nowrap fdm=expr fde=nvim_treesitter#foldexpr() fdn=1 so=3 sts=4" ..
      " sw=4 ts=4 tw=88"
    ),
    group = group,
  }
)


-- javascript ----------------------------------------------
group = vim.api.nvim_create_augroup("JavascriptFileType", {clear = true})
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "javascript",
    command = (
      "setl nowrap fdm=expr fde=nvim_treesitter#foldexpr() fdn=2 so=3 sts=2 sw=2 tw=88"
    ),
    group = group,
  }
)


-- JSON ----------------------------------------------------
group = vim.api.nvim_create_augroup("JsonFileType", {clear = true})
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "json",
    command = (
      "setl nowrap fdm=expr fde=nvim_treesitter#foldexpr() fdn=4 so=3 sts=2 sw=2" ..
      " ts=2 tw=0"
    ),
    group = group,
  }
)


-- lua -----------------------------------------------------
group = vim.api.nvim_create_augroup("LuaFileType", {clear = true})
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "lua",
    command = (
      "setl nowrap fdm=expr fde=nvim_treesitter#foldexpr() fdn=1 so=3 sts=2 sw=2 tw=88"
    ),
    group = group,
  }
)


-- markdown ------------------------------------------------
group = vim.api.nvim_create_augroup("MarkdownFileType", {clear = true})
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "markdown",
    callback = function()
      local set = vim.api.nvim_set_option
      local bufset = vim.api.nvim_buf_set_option
      local winset = vim.api.nvim_win_set_option
      -- concealed text is completely hidden, although I'm not sure anything is
      -- concealed for .md
      winset(0, "conceallevel", 2)
      -- folding settings --
      winset(0, "foldexpr", "nvim_treesitter#foldexpr()")
      winset(0, "foldmethod", "expr")
      winset(0, "foldnestmax", 2)
      -- formatting - turn off formatting comments with `gq`, not sure why --
      vim.cmd("setl fo-=q")
      -- wrap long lines --
      winset(0, "colorcolumn", "89")
      winset(0, "linebreak", true)
      bufset(0, "shiftwidth", 4)
      bufset(0, "softtabstop", 4)
      bufset(0, "tabstop", 4)
      bufset(0, "textwidth", 88)
      set("winwidth", 96)
      winset(0, "wrap", false)
      -- turn off pesky TODO bracket highlighting --
      vim.api.nvim_set_hl(0, "@text.todo", {})
    end,
    group = group,
  }
)


-- Python --------------------------------------------------
group = vim.api.nvim_create_augroup("PythonFileType", {clear = true})
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "python",
    callback = function()
      local set = vim.api.nvim_set_option
      local winset = vim.api.nvim_win_set_option
      -- these are defaults, set project-specific in .nvim.lua in project root --
      vim.cmd("set nowrap so=3 tw=88")
      -- folding settings --
      set("foldlevelstart", 0)  -- collapse all folds in new window --
      winset(0, "foldexpr", "nvim_treesitter#foldexpr()")
      winset(0, "foldlevel", 0)
      winset(0, "foldmethod", "expr")
      winset(0, "foldnestmax", 2)
      -- set leap.nvim highlight color to black-on-white for visibility --
      vim.api.nvim_set_hl(
        0,
        'LeapLabelPrimary',
        -- {fg = 'black', bg = 'white', bold = true, nocombine = true },
        {fg = 'white', bg = 'black', bold = true, nocombine = true }
      )
    end,
    group=group
  }
)
-- execute Black on save --
vim.api.nvim_create_autocmd(
  "BufWritePre", {pattern="*.py,*.pyi", command=":Black", group=group}
)


-- toml ----------------------------------------------------
group = vim.api.nvim_create_augroup("TomlFileType", {clear = true})
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "toml",
    callback = function()
      local winset = vim.api.nvim_win_set_option
      -- folding settings --
      winset(0, "foldexpr", "nvim_treesitter#foldexpr()")
      winset(0, "foldmethod", "expr")
      winset(0, "foldnestmax", 1)
    end,
    group = group,
  }
)


vim.cmd [[

" rst file settings --------------------
augroup filetype_rst
    autocmd!
    " set spell-check on
    " autocmd FileType rst setlocal spell sw=4 sts=4
    autocmd FileType rst setlocal sw=4 sts=4
augroup END

]]


-- XML -----------------------------------------------------
group = vim.api.nvim_create_augroup("filetype_xml", {clear = true})
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = {"xml", "xsd"},
    command = (
      "setl expandtab fde=nvim_treesitter#foldexpr() fdm=expr fdn=8 fo-=q nowrap" ..
      " so=3 sts=2 sw=2 ts=2 tw=88"
    ),
    group = group,
  }
)


vim.cmd [[

" Vimscript file settings --------------
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

]]
