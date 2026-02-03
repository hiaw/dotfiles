return {
  {
    dir = "/Users/danielchong/Development/my-own-projects/gemini_usage_neovim",
    name = "gemini-usage.nvim",
    lazy = false,
    config = function()
      require("gemini_usage").setup({
        project_id = "quantum-rookery-fv00q",
        keymap = "gS",
        enable_keymap = true,
      })
    end,
  },
}
