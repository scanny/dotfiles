
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


-- lua -----------------------------------------------------
group = vim.api.nvim_create_augroup("LuaFileType", {clear = true})
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "lua",
    command = (
      "setl nowrap fdm=expr fde=nvim_treesitter#foldexpr() so=3 sts=2 sw=2 tw=88"
    ),
    group = group,
  }
)


-- Python --------------------------------------------------
group = vim.api.nvim_create_augroup("PythonFileType", {clear = true})
vim.api.nvim_create_autocmd(
  "FileType",
  {pattern="python", command="set fdm=expr nowrap so=3 tw=88", group=group}
)
-- execute Black on save --
vim.api.nvim_create_autocmd(
  "BufWritePre", {pattern="*.py,*.pyi", command=":Black", group=group}
)


-- Git commit ----------------------------------------------
group = vim.api.nvim_create_augroup("GitCommitFileType", {clear = true})
-- cc = colorcolumn, fo = formatoptions, tw = textwidth 
vim.api.nvim_create_autocmd(
  "FileType",
  {pattern="gitcommit", command="set cc=73 fo+=t tw=72", group=group}
)


vim.cmd [[

" Cucumber file settings ---------------
augroup filetype_cucumber
    autocmd!
    autocmd FileType cucumber setlocal fdm=indent sw=2
augroup END


" markdown file settings ---------------
" augroup filetype_md
"     autocmd!
"     autocmd FileType markdown syn clear mkdLineBreak
" augroup END


" rst file settings --------------------
augroup filetype_rst
    autocmd!
    " set spell-check on
    " autocmd FileType rst setlocal spell sw=4 sts=4
    autocmd FileType rst setlocal sw=4 sts=4
augroup END


" Vimscript file settings --------------
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


" XML file settings --------------------
augroup filetype_xml
    autocmd!
    autocmd FileType xml setlocal fdm=syntax ts=2 sw=2 expandtab
    autocmd FileType xsd setlocal fdm=syntax ts=2 sw=2 expandtab
augroup END

]]
