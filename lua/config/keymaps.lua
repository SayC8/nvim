vim.g.mapleader = " "
local map = vim.keymap.set

-- LSP
function FormatFile()
    vim.lsp.buf.format()
    MiniTrailspace.trim()
    MiniTrailspace.trim_last_lines()
end

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>cf", function()
    FormatFile()
end, { desc = "Format" })

-- File management
map("n", "<leader>w", function()
    FormatFile()
    vim.cmd("update")
end, { desc = "Save file (and formats)" })
map("n", "<leader>o", ":w|so<CR>", { desc = "Source file" })

-- File navigation
-- map("n", "<leader>e", ":Ex<CR>")
map("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "Open MiniFiles" })
map("n", "<leader>ff", ":Pick files<CR>", { desc = "Pick files" })
map("n", "<leader>fh", ":Pick help<CR>", { desc = "Pick help" })
map("n", "<leader>/", ":Pick grep_live<CR>", { desc = "Live grep" })

-- Buffers
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Keep centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Run in terminal
map("n", "<leader>t", function()
    local command = vim.fn.input("Command: ")
    if command ~= "" then
        vim.cmd("split")
        vim.cmd("resize 12")
        vim.cmd("term " .. command)
        vim.cmd("$")
    end
end, { desc = "Run a command in terminal" })
