return {
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("eruby", { "html" })
      require("luasnip").filetype_extend("ruby", { "rails" })
    end,
  },
}
