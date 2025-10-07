return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, _)
      vim.filetype.add({
        filename = {
          ["Brewfile"] = "ruby",
        },
      })
    end,
  },
}
