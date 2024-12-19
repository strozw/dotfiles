-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map({ "n" }, "<C-d>", "<cmd>bdelete<cr>", { desc = "close current buffer" })
map({ "n" }, "<C-n>", "<cmd>bnext<cr>", { desc = "switch next buffer" })
map({ "n" }, "<C-p>", "<cmd>bprevious<cr>", { desc = "switch previous buffer" })
