return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      contrast = "hard",
      palette_overrides = {
        dark0_hard = "#1b1b1b",
      },
      transparent_mode = true,
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#1b1b1b",
    },
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
