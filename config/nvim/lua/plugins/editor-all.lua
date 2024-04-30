return {
  {
    "mbbill/undotree",
    event = "VeryLazy",
  },
  {
    "L3MON4D3/LuaSnip",
    keys = {
      { "<tab>", mode = { "i" }, false },
    },
  },
  {
    "Exafunction/codeium.vim",
    lazy = false,
    -- event = "BufEnter",
    config = function()
      vim.keymap.set("i", "<Tab>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("codeium"))
    end,
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-telescope/telescope.nvim", -- Optional
  --     {
  --       "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
  --       opts = {},
  --     },
  --   },
  --   config = true,
  -- },
}
