local null_ls = require('null-ls')

local diagnostics = null_ls.builtins.diagnostics

null_ls.setup(
    {
        -- debug = false,
        debug = true,
        diagnostics_format = "[#{c}] #{m} (#{s})",
        on_attach = require('scanny.lsp.config').on_attach,
        sources = {
            -- formatting.black.with { extra_args = { '--fast' } },
            diagnostics.mypy.with({
              extra_args = { "--strict", },
              -- method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
              -- timeout = 10000,
            }),
            diagnostics.flake8,
        }
    }
)
