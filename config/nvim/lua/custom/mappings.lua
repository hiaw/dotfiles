---@type MappingsTable
local M = {}

M.custom = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },

		[","] = { ":HopWord<CR>", "Hop word" },

		["<C-`>"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"Toggle floating term",
		},

		["<leader>v"] = { ":vsplit<CR>", "Split Vertical" },

		["<A-f>"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },

		["<A-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },

		["<A-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
	},
}

-- more keybinds!
--
return M
