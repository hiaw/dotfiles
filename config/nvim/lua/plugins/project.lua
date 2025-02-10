return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = true,
    },
  },
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>fu",
        function()
          Snacks.picker.projects()
        end,
        desc = "Projects",
      },
    },
  },
}
