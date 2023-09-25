-- local autocmd = vim.api.nvim_create_autocmd

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.foldenable = false

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--<comma>
