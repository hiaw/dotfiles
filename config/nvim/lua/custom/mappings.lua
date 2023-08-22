---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    [","] = { ":HopWord<CR>", "Hop word" },

    ["<C-`>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle floating term",
    },

    ["<leader>v"] = { ":vsplit<CR>", "Split Vertical" },
  },
}

-- more keybinds!
--
return M
