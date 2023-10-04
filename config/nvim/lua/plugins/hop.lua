return {
  {
    "phaazon/hop.nvim",
    lazy = false,
    vscode = true,
    keys = {
      { ",", ":HopWord<CR>", desc = "Hop word" },
    },
    config = function()
      require("hop").setup({
        case_insensitive = false,
      })
    end,
  },
}
