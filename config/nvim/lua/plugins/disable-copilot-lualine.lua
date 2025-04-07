-- Disable Copilot integration with Lualine
return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      -- Remove Copilot status from lualine if it exists
      if opts and opts.sections and opts.sections.lualine_x then
        for i, item in ipairs(opts.sections.lualine_x) do
          -- Check for Copilot status component
          if
            type(item) == "table"
            and type(item[1]) == "function"
            and item.cond
            and opts.sections.lualine_x[i]
            and (
              (
                package.loaded["LazyVim"]
                and LazyVim.config
                and LazyVim.config.icons
                and LazyVim.config.icons.kinds
                and LazyVim.config.icons.kinds.Copilot
                and item[1]() == LazyVim.config.icons.kinds.Copilot
              )
              or (
                package.loaded["lazyvim.config"]
                and require("lazyvim.config").icons
                and require("lazyvim.config").icons.kinds
                and require("lazyvim.config").icons.kinds.Copilot
                and item[1]() == require("lazyvim.config").icons.kinds.Copilot
              )
            )
          then
            -- Remove the Copilot component
            table.remove(opts.sections.lualine_x, i)
            break
          end
        end
      end
      return opts
    end,
  },
}
