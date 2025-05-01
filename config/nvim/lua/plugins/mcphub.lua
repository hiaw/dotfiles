require("which-key").add({
  { "<leader>a", group = "Code Companion" }, -- NOTE: add for avante.nvim
  {
    mode = { "n", "v" },
    {
      "<leader>am",
      function()
        vim.cmd("MCPHub")
      end,
      desc = "MCP Hub Start",
    },
  },
})

-- require("lualine").setup({
--   sections = {
--     lualine_x = {
--       { require("mcphub.extensions.lualine") },
--     },
--   },
-- })

return {
  -- { "ellisonleao/gruvbox.nvim" },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
    },
    -- cmd = "MCPHub", -- lazily start the hub when `MCPHub` is called
    build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
    config = function()
      require("mcphub").setup()
    end,
  },
}
