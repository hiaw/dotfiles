return {
  {
    "phaazon/hop.nvim",
    lazy = false,
    vscode = true,
    keys = {
      { ",", "<cmd>HopWord<CR>", desc = "Hop word" },
    },
    config = function()
      require("hop").setup({
        case_insensitive = false,
      })
    end,
  },
}
