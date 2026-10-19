-- ================================================================================
-- BASIC OPTIONS
-- ================================================================================
-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- UI & Colors
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes:2"
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.laststatus = 3

-- Searching & Replace
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- Scrolling & Navigation
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.splitright = true
vim.opt.splitbelow = true

-- History & Performance
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Native LSP Auto-completion
vim.o.autocomplete = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.completeopt:append("fuzzy")

-- ================================================================================
-- PLUGIN MANAGEMENT
-- ================================================================================
vim.pack.add({
    -- Colorscheme
    { src = "https://github.com/rebelot/kanagawa.nvim" },

    -- LSP
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },

    -- General
    { src = "https://github.com/nvim-mini/mini.nvim" },
})

pcall(vim.cmd.colorscheme, "kanagawa-dragon")

-- ================================================================================
-- PLUGIN CONFIGURATION
-- ================================================================================
local servers = { "lua_ls", "basedpyright", "clangd" }

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers,
})

-- =============================================================================
-- LSP & KEYMAP SETUP
-- =============================================================================
vim.g.mapleader = " "

-- GENERAL
vim.keymap.set("n", "<leader>o", "<cmd>update<cr><cmd>source<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>update<cr>")
vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<cr>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "C-d", "<C-d>zz")
vim.keymap.set("n", "C-u", "<C-u>zz")
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<cr>")

-- MINI
require("mini.icons").setup()
require("mini.files").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.tabline").setup()
require("mini.cmdline").setup()
require("mini.statusline").setup()
require("mini.move").setup()
require("mini.git").setup()
require("mini.diff").setup()

local MiniNotify = require("mini.notify")
MiniNotify.setup()

local MiniTrailspace = require("mini.trailspace")
MiniTrailspace.setup()

local MiniHiPatterns = require("mini.hipatterns")
MiniHiPatterns.setup({
    highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = MiniHiPatterns.gen_highlighter.hex_color(),
    },
})

local MiniPick = require("mini.pick")
MiniPick.setup()
vim.keymap.set("n", "<leader>ff", MiniPick.builtin.files)
vim.keymap.set("n", "<leader>fh", MiniPick.builtin.help)
vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers)
vim.keymap.set("n", "<leader>/", MiniPick.builtin.grep_live)

-- LSP
vim.diagnostic.config({
    -- Inline text showing the error/warning next to the code
    virtual_text = true,
})

-- Global LSP Keybindings (triggered when an LSP attaches to a buffer)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>cf", function()
            vim.lsp.buf.format()
            MiniTrailspace.trim()
            MiniTrailspace.trim_last_lines()
        end, opts)
    end,
})

vim.lsp.config.lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim" } } } } }
