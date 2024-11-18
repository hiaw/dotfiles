return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
      { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
    opts = {
      save_path = "~/Desktop",
      has_breadcrumbs = true,
      bg_theme = "bamboo",
      watermark = "danielchongphd.com",
    },
  },
}
