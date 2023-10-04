return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "astro-language-server",
        "graphql-language-service-cli",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "prettierd",
      },
    },
  },
}
