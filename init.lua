--- THEME & TRANSPARENCY -------------------------
--------------------------------------------------
vim.cmd.colorscheme("unokai")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

--- CONFIGS --------------------------------------
--------------------------------------------------
require("config.options")
require("config.keybinds")
require("config.autocmds")

--- Plugins --------------------------------------
--------------------------------------------------
-- LSP
vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig"},
    { src = "https://github.com/mason-org/mason.nvim"},
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" }
})
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "clangd"}
})
-- GENERAL
vim.pack.add({
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/norcalli/nvim-colorizer.lua" },
})
require("colorizer").setup()
require("oil").setup()

-- MINI
vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.nvim" },
})
require("mini.git").setup()
require("mini.diff").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.trailspace").setup()
require("mini.indentscope").setup()
require("mini.hipatterns").setup()
