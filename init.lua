----------------------------------------
--- OPTIONS
----------------------------------------
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.wrap = false
vim.o.smartindent = true

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.inccommand = "split"

----------------------------------------
--- KEYMAPS
----------------------------------------
local map = vim.keymap.set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>o", ":update<CR>:source<CR>", { desc = "Save and source current file" })
map("n", "<leader>w", ":write<CR>", { desc = "Write current file" })

----------------------------------------
--- PLUGINS
----------------------------------------
vim.pack.add({
    { src = "https://github.com/SayC8/license_gen.nvim" },
    { src = "https://github.com/nvim-mini/mini.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/RRethy/base16-nvim" },
})

require("license_gen").setup()

--- Dynamic Colorscheme Setup
local dank_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
local status, dank_spec = pcall(dofile, dank_path)

if status and dank_spec and dank_spec[1] and dank_spec[1].config then
    dank_spec[1].config()
else
    vim.notify("Failed to load dankcolors.lua: " .. tostring(dank_spec), vim.log.levels.ERROR)
end

--- LSP
require("mason").setup()
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "Language Format" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")

--- MINI
require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.move").setup()
require("mini.tabline").setup()

require("mini.git").setup()
require("mini.diff").setup()
map("n", "<leader>go", MiniDiff.toggle_overlay, { desc = "Toggle Git Diff Overlay" })

require("mini.files").setup()
map("n", "<leader>e", MiniFiles.open, { desc = "Files" })

require("mini.pick").setup()
map("n", "<leader>pf", ":Pick files<CR>", { desc = "Search Files" })
map("n", "<leader>ph", ":Pick help<CR>", { desc = "Search Help" })
map("n", "<leader>/", ":Pick grep_live<CR>", { desc = "Live Grep" })

require("mini.bufremove").setup()
map("n", "<leader>bd", MiniBufremove.delete, { desc = "Delete Buffer" })

local miniclue = require('mini.clue')
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = { 'n', 'x' }, keys = '<Leader>' },

        -- `[` and `]` keys
        { mode = 'n',          keys = '[' },
        { mode = 'n',          keys = ']' },

        -- Built-in completion
        { mode = 'i',          keys = '<C-x>' },

        -- `g` key
        { mode = { 'n', 'x' }, keys = 'g' },

        -- Marks
        { mode = { 'n', 'x' }, keys = "'" },
        { mode = { 'n', 'x' }, keys = '`' },

        -- Registers
        { mode = { 'n', 'x' }, keys = '"' },
        { mode = { 'i', 'c' }, keys = '<C-r>' },

        -- Window commands
        { mode = 'n',          keys = '<C-w>' },

        -- `z` key
        { mode = { 'n', 'x' }, keys = 'z' },
    },

    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.square_brackets(),
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
    },
})
