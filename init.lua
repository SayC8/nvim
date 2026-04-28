vim.cmd.colorscheme("retrobox")
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
opt.scrolloff = 8
opt.sidescrolloff = 12
opt.winborder = "double"

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
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>w", ":write<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>o", ":update<CR>:source<CR>", { desc = "Source file" })

----------------------------------------
--- PLUGINS
----------------------------------------
vim.pack.add {
    "https://github.com/mason-org/mason.nvim.git",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/nvim-mini/mini.nvim.git",
    "https://github.com/SayC8/license_gen.nvim",
}

require("mason").setup()
require("license_gen").setup()

require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.move").setup()
require("mini.tabline").setup()
require("mini.statusline").setup()
require("mini.cmdline").setup()
require("mini.surround").setup()
require("mini.git").setup()
require("mini.diff").setup()

require("mini.files").setup()
vim.keymap.set("n", "<leader>e", MiniFiles.open, { desc = "Files" })

require("mini.pick").setup()
vim.keymap.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Search files" })
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>", { desc = "Search help" })
vim.keymap.set("n", "<leader>fb", ":Pick buffers<CR>", { desc = "Search buffers" })
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

----------------------------------------
--- LSP
----------------------------------------
local lsp_servers = {
    "lua_ls",
    "clangd",
    "basedpyright",
    "ols",
    "intelephense",
    "perlnavigator"
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
        pl = "perl"
    },
})

vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Code Format" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
})
