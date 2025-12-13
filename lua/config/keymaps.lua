vim.g.mapleader = " "
local map = vim.keymap.set

-- File management
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>o", ":w|so<CR>", { desc = "Source file" })

-- File navigation
-- map("n", "<leader>e", ":Ex<CR>")
map("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "Open MiniFiles" })
map("n", "<leader>ff", ":Pick files<CR>", { desc = "Pick files" })
map("n", "<leader>fh", ":Pick help<CR>", { desc = "Pick help" })
map("n", "<leader>/", ":Pick grep_live<CR>", { desc = "Live grep"})

-- Buffers
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Keep centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
