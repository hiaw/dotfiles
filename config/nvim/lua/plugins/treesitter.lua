local extra_parsers = {
  "astro",
  "css",
  "dockerfile",
  "go",
  "graphql",
  "json",
  "markdown",
  "python",
  "rust",
  "typescript",
  "tsx",
  "yaml",
}

local function has_compiler()
  return vim.fn.executable("cc") == 1 or vim.fn.executable("gcc") == 1 or vim.fn.executable("clang") == 1
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = function(_, opts)
      if not has_compiler() then
        opts.ensure_installed = {}
      elseif type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, extra_parsers)
      end

      opts.highlight = { enable = true, additional_vim_regex_highlighting = false }
      opts.indent = { enable = true }
      opts.incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<C-s>",
          node_decremental = "<C-backspace>",
        },
      }
      opts.textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      }
    end,
  },
}
