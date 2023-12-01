--------------------------------------------------------------------------------------
-- jump from a code file to it's test file, etc.
--
return {
  "tpope/vim-projectionist",
  config = function()
    -- vim.g.projectionist_heuristics = {
    --   ["*"] = {
    --     ["unstructured/partition/*.py"] = {
    --       alternate = {
    --         "test_unstructured/partition/test_{basename}.py",
    --         "test_unstructured/partition/{basename}/test_{basename}.py",
    --       },
    --       type = "source",
    --     },
    --     ["test_unstructured/**/test_*.py"] = {
    --       alternate = {
    --         "unstructured/{dirname}/{basename}.py",
    --         "unstructured/{dirname|dirname}/{basename}.py",
    --       },
    --       type = "test",
    --     },
    --   },
    -- }
  end,
}
