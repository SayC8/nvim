----------------------------------------
--- KEYMAPS
----------------------------------------
local map = vim.keymap.set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>o", ":update<CR>:source<CR>", { desc = "Save and source current file" })
map("n", "<leader>w", ":write<CR>", { desc = "Write current file" })
