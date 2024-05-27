return { -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          filetypes_include = { "rust" },
          init_options = {
            userLanguages = {
              rust = "html",
            },
          },
        },
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  -- {
  --   "echasnovski/mini.hipatterns",
  --   opts = {
  --     -- custom LazyVim option to enable the tailwind integration
  --     tailwind = {
  --       enabled = true,
  --       ft = { "rust" },
  --       style = "full",
  --     },
  --   },
  -- },
}
