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
