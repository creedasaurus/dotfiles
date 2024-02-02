return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
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
        name = "Home",
        path = "~/Documents/Obsidian/Home",
      },
      {
        name = "Work",
        path = "~/Documents/Obsidian/Work",
      },
    },

    detect_cwd = true,
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "Daily",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "Daily/templates/Daily template.md",
    },
  },
}
