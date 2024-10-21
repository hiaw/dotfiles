-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.wrap = true
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.backupcopy = "yes"

-- vim.lsp.set_log_level("debug")

-- vim.api.nvim_create_user_command("CodeiumChat", "call codeium#Chat()", {})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = ".env",
  callback = function()
    vim.diagnostic.enable(false)
  end,
})
