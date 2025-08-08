-- Configure `rust-analyzer`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
-- For the default config, along with instructions on how to customize the settings

return {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        -- enable = false;
        enable = true;
      }
    }
  }
}
