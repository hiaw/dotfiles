return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", vim.fn.expand("~/.dotfiles/runcom/markdownlint-cli2.jsonc"), "--" },
      },
    },
  },
}
