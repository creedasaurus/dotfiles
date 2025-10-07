return {
  -- {
  --   "nvim-java/nvim-java",
  --   config = false,
  --   dependencies = {
  --     {
  --       "neovim/nvim-lspconfig",
  --       opts = {
  --         servers = {
  --           -- Your JDTLS configuration goes here
  --           jdtls = {
  --             settings = {
  --               java = {
  --                 configuration = {
  --                   runtimes = {
  --                     {
  --                       name = "JavaSE-21",
  --                       path = "/Users/creed.haymond/.local/share/mise/installs/java/corretto-21",
  --                     },
  --                   },
  --                 },
  --               },
  --             },
  --           },
  --         },
  --         setup = {
  --           jdtls = function()
  --             -- Your nvim-java configuration goes here
  --             require("java").setup({
  --               root_markers = {
  --                 "settings.gradle",
  --                 "settings.gradle.kts",
  --                 "pom.xml",
  --                 "build.gradle",
  --                 "mvnw",
  --                 "gradlew",
  --                 "build.gradle",
  --                 "build.gradle.kts",
  --                 ".git",
  --               },
  --             })
  --           end,
  --         },
  --       },
  --     },
  --   },
  -- },
  {

    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "java" },
    },
  },
}
