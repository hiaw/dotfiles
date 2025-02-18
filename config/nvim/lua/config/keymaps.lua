-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", ";", ":", { desc = "enter command mode", nowait = true })

local map = LazyVim.safe_keymap_set
map("n", "<C-/>", function()
  return MiniComment.operator() .. "_"
end, { desc = "Toggle Comment", expr = true })
map("x", "<C-/>", function()
  return MiniComment.operator()
end, { desc = "Toggle Comment", expr = true })
