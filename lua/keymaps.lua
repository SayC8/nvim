vim.g.mapleader = " "

vim.keymap.set("n", "<leader>o", "<cmd>update<cr><cmd>source<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>update<cr>")
vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<cr>")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "C-d", "<C-d>zz")
vim.keymap.set("n", "C-u", "<C-u>zz")

vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<cr>")

vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>")
