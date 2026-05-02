return {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  root_markers = { "ty.toml", "pyproject.toml", ".git" },
  on_attach = function(client, _)
    -- disable semantic tokens to preserve Treesitter highlighting --
    client.server_capabilities.semanticTokensProvider = nil
  end,
  settings = {
    ty = {
      experimental = {
        rename = true,
      },
      inlayHints = {
        callArgumentNames = false,
        variableTypes = true,
      },
    },
  },
}
