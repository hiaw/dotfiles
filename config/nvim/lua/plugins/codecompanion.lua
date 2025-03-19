require("which-key").add({
  { "<leader>a", group = "Code Companion" }, -- NOTE: add for avante.nvim
  {
    mode = { "n", "v" },
    {
      "<leader>aa",
      function()
        require("codecompanion").toggle()
      end,
      desc = "Code Companion Toggle Chat",
    },
    {
      "<leader>ac",
      function()
        require("codecompanion").actions()
      end,
      desc = "Code Companion Actions",
    },
    {
      "<leader>an",
      function()
        require("codecompanion").chat("add")
      end,
      desc = "Code Companion New Chat",
    },
    -- {
    --   "<leader>ai",
    --   function()
    --     require("codecompanion").inline()
    --   end,
    --   desc = "Code Companion Inline",
    -- },
  },
})

return {
  {
    "olimorris/codecompanion.nvim",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
      "ravitemer/mcphub.nvim",
    },
    opts = {
      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "claude-3.7-sonnet",
              },
            },
          })
        end,
        -- claude = function()
        --   return require("codecompanion.adapters").extend("claude", {
        --     -- schema = {
        --     --   model = {
        --     --     default = "claude-3.7-sonnet",
        --     --   },
        --     -- },
        --     aws = {
        --       region = "us-west-2", -- Replace with your AWS region
        --       access_key_id = os.getenv("AWS_ACCESS_KEY_ID"),
        --       secret_access_key = os.getenv("AWS_SECRET_ACCESS_KEY"),
        --       session_token = os.getenv("AWS_SESSION_TOKEN"), -- Optional, if using temporary credentials
        --     },
        --     aws = {
        --       region = "us-west-2", -- Replace with your AWS region
        --       profile = "your-sso-profile", -- Replace with your SSO profile name
        --     },
        --   })
        -- end,
      },
      strategies = {
        chat = {
          adapter = "copilot",
          tools = {
            ["mcp"] = {
              -- calling it in a function would prevent mcphub from being loaded before it's needed
              callback = function()
                return require("mcphub.extensions.codecompanion")
              end,
              description = "Call tools and resources from the MCP Servers",
              opts = {
                requires_approval = true,
              },
            },
          },
        },
        inline = { adapter = "copilot" },
      },
      display = {
        chat = {
          auto_scroll = false,
        },
      },
    },
    init = function()
      require("plugins.codecompanion.fidget-spinner"):init()
    end,
  },
  -- {
  --   "saghen/blink.cmp",
  --   opts = {
  --     sources = {
  --       per_filetype = {
  --         codecompanion = { "codecompanion" },
  --       },
  --     },
  --   },
  -- },
}
