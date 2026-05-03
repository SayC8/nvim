---@diagnostic disable: undefined-global
----------------------------------------
--- OPTIONS
----------------------------------------
local opt = vim.opt
-- Appearance and UI
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes:2"
opt.cursorline = true
opt.laststatus = 3
opt.showmode = false
opt.pumheight = 10
opt.cmdheight = 1
opt.smoothscroll = true
opt.scrolloff = 10
opt.sidescrolloff = 12
opt.winborder = "single"
opt.colorcolumn = "100"

-- Behaviour and Performance
opt.updatetime = 300
opt.timeoutlen = 300
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.undofile = true
opt.swapfile = false
opt.confirm = true

-- Tabs and Indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.autoindent = true
opt.wrap = false

-- Windows and Splitting
opt.splitright = true
opt.splitbelow = true
opt.winminwidth = 6

-- Search
opt.smartcase = true
opt.ignorecase = true
opt.incsearch = true
opt.inccommand = "nosplit"
opt.hlsearch = false

----------------------------------------
--- GENERAL KEYMAPS
----------------------------------------
local map = vim.keymap.set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>w", ":write<CR>", { desc = "Save file" })
map("n", "<leader>o", ":update<CR>:source<CR>", { desc = "Source file" })
map("n", "<leader>q", ":quit<CR>", { desc = "Close" })
map("n", "<F5>", ":update<CR>:make<CR>", { desc = "Run Makefile" })

----------------------------------------
--- PLUGINS
----------------------------------------
local plugin_list = {
    "https://github.com/sainnhe/everforest.git",
    "https://github.com/nvim-mini/mini.nvim.git",
    "https://github.com/mason-org/mason.nvim.git",
    "https://github.com/neovim/nvim-lspconfig.git",
    "https://github.com/SayC8/license_gen.nvim.git",
}

--- AUTOMATIC PLUGIN CLEANUP
-- Remove from list above and restart neovim, make sure any
-- require(<plugin>).setup() etc. is also removed from config

-- 1. Create lookup table of desired directory names
local desired_plugins = {}

for _, url in ipairs(plugin_list) do
    -- Extract the repository name (e.g., 'mini.nvim' from '.../mini.nvim.git')
    local name = url:match("([^/]+)$"):gsub("%.git$", "")
    desired_plugins[name] = true
end

-- 2. Add current plugins
for _, plugin in ipairs(plugin_list) do
    vim.pack.add { plugin }
end

-- 3. Cleanup logic
local pack_path = vim.fn.stdpath('data') .. '/site/pack/core/opt'

if vim.fn.isdirectory(pack_path) == 1 then
    local installed_plugins = vim.fn.readdir(pack_path)
    for _, installed_name in ipairs(installed_plugins) do
        -- If an installed directory isn't in our desired list, delete it
        if not desired_plugins[installed_name] then
            print("Removing plugin: " .. installed_name)
            vim.pack.del { installed_name }
        end
    end
end

-- Colorscheme
vim.g.everforest_background = 'hard'
vim.cmd.colorscheme("everforest")

-- License Generator
require("license_gen").setup()

-- Mini
local MiniMisc = require("mini.misc")
MiniMisc.setup_termbg_sync() -- Matches terminal bg to nvim bg

require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.move").setup()
require("mini.tabline").setup()
require("mini.statusline").setup()
require("mini.cmdline").setup()
require("mini.surround").setup()
require("mini.git").setup()
require("mini.diff").setup()
require("mini.extra").setup()

require("mini.files").setup()
vim.keymap.set("n", "<leader>e", MiniFiles.open, { desc = "Files" })

require("mini.pick").setup()
vim.keymap.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Search files" })
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>", { desc = "Search help" })
vim.keymap.set("n", "<leader>fb", ":Pick buffers<CR>", { desc = "Search buffers" })
vim.keymap.set("n", "<leader>fc", ":Pick colorschemes<CR>", { desc = "Search colorschemes" })
vim.keymap.set("n", "<leader>/", ":Pick grep_live<CR>", { desc = "Live Grep" })

require("mini.bufremove").setup()
vim.keymap.set("n", "<leader>bd", MiniBufremove.delete, { desc = "Delete buffer" })

require('mini.completion').setup({
    lsp_completion = {
        source_func = 'omnifunc',
        auto_setup = true,
    },
})
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
    end,
})

local hipatterns = require('mini.hipatterns')
hipatterns.setup({
    highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
    },
})

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

--- LSP
require("mason").setup()

local lsp_servers = {
    "lua_ls",
    "clangd",
    "basedpyright",
    "ruff",
    "ols",
}
for _, server in pairs(lsp_servers) do
    vim.lsp.enable(server)
end

vim.lsp.config("lua_ls", {
    settings = { Lua = { diagnostics = { globals = { "vim" } } } }
})

-- Fix mismatched filetypes
vim.filetype.add({
    extension = {
        -- pl = "perl"
    },
})

vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Code Format" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })

--------------------------------------------------
--- EXTRAS
--------------------------------------------------
-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
})
