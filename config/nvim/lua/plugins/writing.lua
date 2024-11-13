return {
  {
    "folke/zen-mode.nvim",
    opts = {
      on_open = function()
        vim.o.cmdheight = 1
      end,
      on_close = function()
        vim.o.cmdheight = 0
      end,
      window = {
        options = {
          signcolumn = "no",
          cursorline = false,
        },
      },
    },
  },
  {
    "folke/twilight.nvim",
    opts = {},
  },
  { "preservim/vim-pencil" },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "Default",
          path = "~/Documents/vault",
        },
      },

      -- see below for full list of options 👇
    },
  },
}
