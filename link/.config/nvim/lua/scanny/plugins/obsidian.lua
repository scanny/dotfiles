return {
  "epwalsh/obsidian.nvim",
  -- lazy = true,
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "obsidian-vault",
        path = "~/Dropbox/obsidian-vault",
      },
      -- {
      --   name = "work",
      --   path = "~/vaults/work",
      -- },
    },

    -- Optional, completion.
    completion = {
      -- If using nvim-cmp, otherwise set to false
      nvim_cmp = true,
      -- Trigger completion at 2 chars
      min_chars = 2,
      -- Where to put new notes created from completion. Valid options are
      --  * "current_dir" - put new notes in same directory as the current buffer.
      --  * "notes_subdir" - put new notes in the default notes subdirectory.
      new_notes_location = "current_dir",

      -- Whether to add the output of the node_id_func to new notes in autocompletion.
      -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
      prepend_note_id = true
    },
  },
}
