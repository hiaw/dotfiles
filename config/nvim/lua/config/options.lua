-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.wrap = true
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.backupcopy = "yes"

-- Enhanced editor experience
vim.opt.scrolloff = 8 -- Keep 8 lines visible around cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns visible around cursor
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.ignorecase = true -- Ignore case in searches
vim.opt.smartcase = true -- Use case-sensitive if uppercase present
vim.opt.updatetime = 250 -- Faster completion
vim.opt.timeoutlen = 300 -- Faster which-key popup
vim.opt.undofile = true -- Persistent undo
vim.opt.swapfile = false -- Disable swap files
vim.opt.backup = false -- Disable backup files

-- Better performance
vim.opt.regexpengine = 1 -- Use old regex engine (often faster)
vim.opt.synmaxcol = 300 -- Limit syntax highlighting for long lines

-- Better editing experience
vim.opt.cursorline = true -- Highlight current line
vim.opt.colorcolumn = "80,120" -- Visual guides for line length
vim.opt.splitbelow = true -- Open horizontal splits below
vim.opt.splitright = true -- Open vertical splits to the right
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.pumheight = 10 -- Limit popup menu height
vim.opt.completeopt = "menu,menuone,noselect" -- Better completion

-- Better diagnostics
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = "if_many",
  },
  severity_sort = true,
  float = {
    source = "always",
    border = "rounded",
  },
})

-- Diagnostic signs
local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- vim.api.nvim_create_user_command("CodeiumChat", "call codeium#Chat()", {})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = ".env",
  callback = function()
    vim.diagnostic.enable(false)
  end,
})
