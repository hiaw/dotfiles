-- local autocmd = vim.api.nvim_create_autocmd

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--<comma>
