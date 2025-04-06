-- Fix for the Copilot lualine integration
return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      -- Find and remove the problematic LazyVim Copilot status component
      if opts.sections and opts.sections.lualine_x then
        for i, item in ipairs(opts.sections.lualine_x) do
          if type(item) == "table" and item[1] and item[1] == LazyVim.config.icons.kinds.Copilot then
            table.remove(opts.sections.lualine_x, i)
            break
          end
        end
      end
      
      -- Add a safer implementation
      table.insert(
        opts.sections.lualine_x,
        2,
        {
          LazyVim.config.icons.kinds.Copilot,
          function()
            local clients = vim.lsp.get_active_clients({ name = "copilot" })
            if #clients > 0 then
              local copilot_api = package.loaded["copilot.api"]
              if copilot_api and copilot_api.status and copilot_api.status.data then
                local status = copilot_api.status.data.status
                return (status == "InProgress" and "pending") 
                  or (status == "Warning" and "error") 
                  or "ok"
              else
                return "ok" -- Default when API structure is unavailable
              end
            end
            return ""
          end,
          cond = function()
            return package.loaded["copilot"] ~= nil
          end,
        }
      )
    end,
  },
}
