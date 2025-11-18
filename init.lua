--- CONFIGS --------------------------------------
--------------------------------------------------
require("config.options")
require("config.keybinds")
require("config.autocmds")

--- Plugins --------------------------------------
--------------------------------------------------
-- LSP
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" }
})
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "clangd" }
})
-- GENERAL
vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/norcalli/nvim-colorizer.lua" },
  { src = "https://github.com/shaunsingh/nord.nvim" },
})
require("colorizer").setup()
require("oil").setup({
  keymaps = {
    ["q"] = { "actions.close", mode = "n" },
  },
  columns = {
    "permissions",
    "size",
    "mtime",
    "icon",
  },
  view_options = {
    show_hidden = true,
  },
})

-- MINI
vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.nvim" },
})
require("mini.icons").setup()
require("mini.git").setup()
require("mini.diff").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.trailspace").setup()
require("mini.indentscope").setup()
require("mini.statusline").setup()
require("mini.tabline").setup()

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

--- THEME & TRANSPARENCY -------------------------
--------------------------------------------------
vim.cmd.colorscheme("nord")
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
