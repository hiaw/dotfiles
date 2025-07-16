return {
  -- Better quickfix list
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    opts = {},
  },
  
  -- Enhanced f/F/t/T motions
  {
    "rhysd/clever-f.vim",
    keys = { "f", "F", "t", "T" },
    init = function()
      vim.g.clever_f_smart_case = 1
      vim.g.clever_f_across_no_line = 1
    end,
  },
  
  -- Enhanced marks
  {
    "chentoast/marks.nvim",
    event = "BufReadPre",
    opts = {},
  },
  
  -- Better surround operations
  {
    "kylechui/nvim-surround",
    event = "BufReadPre",
    opts = {},
  },
}