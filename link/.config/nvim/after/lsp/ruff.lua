-- Configure the built-in `ruff` LSP server.
return {
  cmd = { 'ruff', 'server', '--preview' },
  filetypes = { 'python' },
  init_options = {
    -- Ruff language server settings go here
    settings = {
      -- configurationPreference = "filesystemFirst",
      configurationPreference = "editorFirst",
      -- do not register server as capable of handling source.fixAll code actions --
      fixAll = false,
      lineLength = 100,
      -- register the server as capable of handling source.organizeImports code actions --
      organizeImports = true,
      preview = true,
      format = {
        preview = true,
      },
      lint = {
        enable = true,
        ignore = {
          "COM812",   -- over aggressively insists on trailing commas where not desireable --
          "F841",     -- unused variable, avoid duplicat by leaving this for `pyright` to pick up --
          "PT001",    -- wants empty parens on @pytest.fixture where not used (essentially always) --
          "PT011",    -- pytest.raises({exc}) too broad, use match param or more specific exception --
          "PT012",    -- pytest.raises() block should contain a single simple statement --
          "SIM117",   -- merge `with` statements for context managers that have same scope --
        },
        preview = true,
        select = {
          "C4",       -- flake8-comprehensions --
          "COM",      -- flake8-commas --
          "E",        -- pycodestyle errors --
          "F",        -- pyflakes --
          "I",        -- isort (imports) --
          "PLR0402",  -- Name compared with itself like `foo == foo` --
          "PT",       -- flake8-pytest-style --
          "SIM",      -- flake8-simplify --
          "UP015",    -- redundant `open()` mode parameter (like "r" is default) --
          "UP018",    -- Unnecessary {literal_type} call like `str("abc")`. (rewrite as a literal) --
          "UP032",    -- Use f-string instead of `.format()` call --
          "UP034",    -- Avoid extraneous parentheses --
          "W",        -- Warnings, including invalid escape-sequence --
        },
      },
    }
  }
}
