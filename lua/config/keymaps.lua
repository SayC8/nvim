local map = vim.keymap.set
local opts = { silent = true, noremap = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Searching
map("n", "<Esc>", "<cmd>nohl<cr>", opts)

-- Saving
map("n", "<C-s>", "<cmd>w<cr>", opts) -- save current file
map("n", "<leader><C-s>", "<cmd>w<cr><cmd>so<cr>", opts) -- save and source current file

-- Close
map("n", "<leader>q", "<cmd>q<cr>", opts)

-- NeoTree
map("n", "<leader>e", "<cmd>Neotree filesystem toggle float<cr>", opts)

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", opts)

-- Mason
map("n", "<leader>m", "<cmd>Mason<cr>", opts)

-- Splits
map("n", "<leader>h", "<cmd>split<cr>", opts)
map("n", "<leader>v", "<cmd>vsplit<cr>", opts)
map("n", "<C-h>", "<C-w><C-h>", opts)
map("n", "<C-j>", "<C-w><C-j>", opts)
map("n", "<C-k>", "<C-w><C-k>", opts)
map("n", "<C-l>", "<C-w><C-l>", opts)

-- Telescope
map("n", "<leader>sf", "<cmd>Telescope find_files theme=ivy<cr>", opts)
map("n", "<leader>sg", "<cmd>Telescope live_grep theme=ivy<cr>", opts)
map("n", "<leader>sb", "<cmd>Telescope buffers theme=ivy<cr>", opts)
map("n", "<leader>sh", "<cmd>Telescope help_tags theme=ivy<cr>", opts)
map("n", "<leader>sk", "<cmd>Telescope keymaps theme=ivy<cr>", opts)

-- Buffers
map("n", "<leader>x", "<cmd>bdelete!<cr>", opts) -- delete current buffer
map("n", "<leader>]", "<cmd>bnext<cr>", opts) -- next buffer
map("n", "<leader>[", "<cmd>bprev<cr>", opts) -- prev buffer

-- Move highlighted up/down
map("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)

-- Center half page jump and searches
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Extras
map("n", "J", "mzJ`z") -- better shift J combine
map("x", "<leader>p", '\"_dP') -- keep yanked after paste
map("i", "<C-c>", "<Esc>") -- Ctrl C same as escape
map("n", "Q", "<nop>") -- remove capital Q prison
