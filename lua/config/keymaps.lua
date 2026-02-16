----------------------------------------
--- KEYMAPS
----------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { desc = desc })
end

map("n", "<leader>o", ":update<CR>:source<CR>", "Save and source current file")
map("n", "<leader>w", ":write<CR>", "Write current file")

map("n", "<leader>nh", ":nohlsearch<CR>", "Remove search highlight")

--- Splits/Windows
map("n", "<C-h>", "<C-w><C-h>", "Focus left split")
map("n", "<C-j>", "<C-w><C-j>", "Focus bottom split")
map("n", "<C-k>", "<C-w><C-k>", "Focus top split")
map("n", "<C-l>", "<C-w><C-l>", "Focus right split")
map("n", "<leader>q", "<C-w><C-q>", "Quit/Close Split")
