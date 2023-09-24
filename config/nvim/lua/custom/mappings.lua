---@type MappingsTable
local M = {}

M.custom = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },

		[","] = { ":HopWord<CR>", "Hop word" },

		["<leader>v"] = { ":vsplit<CR>", "Split Vertical" },

		["<A-f>"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },

		["<leader>fs"] = { "<cmd> Telescope grep_string <CR>", "Grep String" },

		["<A-S-f>"] = { "<cmd> Telescope grep_string <CR>", "Grep String" },

		["<A-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },

		["<A-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
	},
}

-- more keybinds!
--
return M
