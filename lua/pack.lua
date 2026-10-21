vim.pack.add({
    -- COLORSCHEME
    { src = "https://github.com/rebelot/kanagawa.nvim" },

    -- LSP
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },

    -- MINI
    { src = "https://github.com/nvim-mini/mini.nvim" },

    -- Extras
    { src = "https://github.com/SayC8/license_gen.nvim" },
})

-- License generator
require("license_gen").setup({})

-- MINI
require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.tabline").setup()
require("mini.cmdline").setup()
require("mini.statusline").setup()
require("mini.move").setup()
require("mini.git").setup()
require("mini.diff").setup()

require("mini.completion").setup()
require("mini.snippets").setup()

local MiniFiles = require("mini.files")
MiniFiles.setup()
vim.keymap.set("n", "<leader>e", MiniFiles.open)

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

local MiniExtra = require("mini.extra")
vim.keymap.set("n", "<leader>fc", MiniExtra.pickers.colorschemes)

-- LSP
local servers = { "lua_ls", "clangd", "ols", "ts_ls", "bashls" }

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = servers,
})

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

-- Extend or define the configuration for lua_ls
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        },
    },
})

require("treesitter")
