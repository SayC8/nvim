----------------------------------------
--- KEYMAPS
----------------------------------------
local map = vim.keymap.set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>o", ":update<CR>:source<CR>", { desc = "Save and source current file" })
map("n", "<leader>w", ":write<CR>", { desc = "Write current file" })

-- Navigate completion menu with Tab
map("i", "<Tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })

map("i", "<S-Tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true })
