return {
  {
    "mbbill/undotree",
    event = "VeryLazy",
  },
  {
    "L3MON4D3/LuaSnip",
    keys = {
      { "<Tab>", function() end, mode = { "i" }, expr = false },
    },
  },
  -- {
  --   "Exafunction/codeium.vim",
  --   lazy = false,
  --   -- event = "BufEnter",
  --   config = function()
  --     vim.keymap.set("i", "<Tab>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true, silent = true })
  --   end,
  -- },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   optional = true,
  --   event = "VeryLazy",
  --   opts = function(_, opts)
  --     table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("codeium"))
  --   end,
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     inlay_hints = { enabled = true, exclude = { "typescriptreact", "typescript" } },
  --   },
  -- },
  { "nvim-neotest/neotest-jest" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-jest" } },
  },
  -- {
  --   url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  --   ft = { "typescriptreact" },
  --   dependencies = {
  --     "mfussenegger/nvim-jdtls",
  --     "williamboman/mason.nvim",
  --   },
  --   config = function()
  --     local sonar_language_server_path =
  --       require("mason-registry").get_package("sonarlint-language-server"):get_install_path()
  --     local analyzers_path = sonar_language_server_path .. "/extension/analyzers"
  --     require("sonarlint").setup({
  --       server = {
  --         cmd = {
  --           sonar_language_server_path .. "/sonarlint-language-server.cmd",
  --           "-stdio",
  --           "-analyzers",
  --           vim.fn.expand(analyzers_path .. "/sonarjs.jar"),
  --         },
  --       },
  --       filetypes = {
  --         "typescriptreact",
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  --   },
  --   opts = {
  --     servers = {
  --       sonarlint = {},
  --     },
  --     setup = {
  --       sonarlint = function()
  --         require("sonarlint").setup({
  --           server = {
  --             cmd = {
  --               "sonarlint-language-server",
  --               -- Ensure that sonarlint-language-server uses stdio channel
  --               "-stdio",
  --               "-analyzers",
  --               -- paths to the analyzers you need, using those for python and java in this example
  --               vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
  --               vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
  --               vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
  --             },
  --           },
  --
  --           filetypes = {
  --             "typescriptreact",
  --           },
  --         })
  --       end,
  --     },
  --   },
  -- },
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
