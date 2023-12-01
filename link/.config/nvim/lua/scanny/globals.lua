--------------------------------------------------------------------------------------
-- Global Lua functions for plugin debugging
--

P = function (v)
  -- Print the argument, like __repr__() in Python.
  --
  -- Shows the contents of a table, perhaps some other useful things.

  print(vim.inspect(v))
  return v
end

RELOAD = function (...)
  return require("plenary.reload").reload_module(...)
end

R = function (name)
  -- Reload and require.
  --
  -- Removes cached version of Lua module at `name` and reload it, returning its value.
  -- Used like a non-caching replacement for `require()`.

  RELOAD(name)
  return require(name)
end
