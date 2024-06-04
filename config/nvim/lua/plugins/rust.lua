return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = ":TSUpdate",
  --   config = function()
  --     local configs = require("nvim-treesitter.configs")
  --
  --     configs.setup({
  --       ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust" },
  --       sync_install = false,
  --       highlight = { enable = true },
  --       indent = { enable = true },
  --     })
  --   end,
  -- },
  -- {
  --   "rayliwell/tree-sitter-rstml",
  --   dependencies = { "nvim-treesitter" },
  --   build = ":TSUpdate",
  --   config = function()
  --     require("tree-sitter-rstml").setup()
  --   end,
  -- },
  -- -- Experimental automatic tag closing and renaming (optional)
  -- {
  --   "rayliwell/nvim-ts-autotag",
  --   config = function()
  --     require("nvim-ts-autotag").setup()
  --   end,
  -- },
}
