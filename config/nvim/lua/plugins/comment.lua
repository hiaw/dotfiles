return {
  {
    "numToStr/Comment.nvim",
    keys = {
      {
        "<leader>v",
        "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
        mode = "v",
        desc = "Toggle comment",
      },
      {
        "<leader>v",
        "<ESC><cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
        mode = "n",
        desc = "Toggle comment",
      },
    },
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },
}
