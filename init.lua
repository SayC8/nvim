require("config.options")
require("config.keymaps")

-- PACK
vim.pack.add({
    { src = "https://github.com/AlexvZyl/nordic.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter.git" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/nvim-mini/mini.nvim.git" },
})

-- COLORSCHEME
vim.cmd("colorscheme nordic")

-- TREESITTER
require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc" },
    auto_install = true,
})

-- LSP
require("mason").setup({})
require("mason-lspconfig").setup({})

-- MINI
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.icons").setup()
require("mini.files").setup()
require("mini.pick").setup()
require("mini.move").setup()
require("mini.cmdline").setup()
require("mini.tabline").setup()
require("mini.statusline").setup()
require("mini.snippets").setup()
require("mini.completion").setup()
require("mini.trailspace").setup()
require("mini.hipatterns").setup({
    highlighters = {
        fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
        hack  = { pattern = 'HACK', group = 'MiniHipatternsHack' },
        todo  = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
        note  = { pattern = 'NOTE', group = 'MiniHipatternsNote' },
    }
})


local miniclue = require('mini.clue')
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
    },

    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
    },
})
