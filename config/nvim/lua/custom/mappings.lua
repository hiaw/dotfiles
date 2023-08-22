---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    [","] = { ":HopWord<CR>", "Hop word" },
  },
}

-- more keybinds!

return M
