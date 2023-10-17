return {

  {
    "NvChad/nvterm",
    lazy = false,
    keys = {
      {
        "<C-v>",
        function()
          require("nvterm.terminal").toggle("horizontal")
        end,
        desc = "Toggle horizontal term",
      },
    },
    config = function(_, opts)
      require("nvterm").setup(opts)
    end,
  },
}
