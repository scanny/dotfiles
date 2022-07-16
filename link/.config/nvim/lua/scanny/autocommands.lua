

-- FocusLost - automatically save all buffers after tabbing away from vim --
local group = vim.api.nvim_create_augroup("OnLoseFocus", {clear = true})
vim.api.nvim_create_autocmd("FocusLost", { command = ":silent wall", group = group })


-- FocusGained - in conjunction with `set autoread`, automatically re-read
-- externally-changed file when focus is regained
local group = vim.api.nvim_create_augroup("OnGainFocus", {clear = true})
vim.api.nvim_create_autocmd("FocusGained", { command = ":checktime", group = group })


-- ignore CR mapping (to :noh) in special windows like quickfix --
local group = vim.api.nvim_create_augroup("NoCRMapInQuickfix", {clear = true})
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


-- Python --------------------------------------------------
local group = vim.api.nvim_create_augroup("PythonFileType", {clear = true})
vim.api.nvim_create_autocmd(
    "FileType",
    {pattern="python", command="set fdm=expr nowrap so=3 tw=88", group=group}
)
-- execute Black on save --
vim.api.nvim_create_autocmd(
    "BufWritePre", {pattern="*.py", command=":Black", group=group}
)


-- Git commit ----------------------------------------------
local group = vim.api.nvim_create_augroup("GitCommitFileType", {clear = true})
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
