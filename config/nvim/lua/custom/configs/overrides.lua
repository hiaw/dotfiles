local M = {}

M.treesitter = {
	ensure_installed = {
		-- "vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		-- "c",
		"markdown",
		"markdown_inline",
		-- "rust",
		-- "toml"
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",
		-- "luaformatter",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"prettier",

		-- c/cpp stuff
		-- "clangd",
		-- "clang-format",

		-- rust stuff
		-- "cpptools",
		-- "codelldb",
		-- "rust-analyzer",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.nvterm = {
	terminals = {
		type_opts = {
			float = {
				row = 0.02,
				col = 0.05,
				width = 0.9,
				height = 0.9,
			},
		},
	},
}

M.telescope = {
	defaults = {
		file_ignore_patterns = { "cdk.out", "coverage", "node_modules", "Index/DataStore" },
	},
}

return M
