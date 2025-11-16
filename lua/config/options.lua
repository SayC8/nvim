local o = vim.opt

-- Basics 
o.number = true
o.relativenumber = true
o.cursorline = false
o.wrap = false
o.scrolloff = 10
o.sidescrolloff = 8

-- Indentation
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true
o.autoindent = true
o.smartindent = true

-- Search
o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

-- Visual
o.termguicolors = true
o.signcolumn = "yes"
o.colorcolumn = "100"
o.showmatch = true
o.matchtime = 2
o.cmdheight = 1
o.completeopt = "menuone,noinsert,noselect"
o.showmode = false
o.pumheight = 10
o.pumblend = 10
o.winblend = 0
o.conceallevel = 0
o.concealcursor = ""
o.lazyredraw = true
o.synmaxcol = 300

-- File handling
o.backup = false
o.writebackup = false
o.swapfile = false
o.undofile = true
o.undodir = vim.fn.expand("~/.vim/undodir")
o.updatetime = 300
o.timeoutlen = 500
o.ttimeoutlen = 0
o.autoread = true
o.autowrite = false

-- Splits
o.splitbelow = true
o.splitright = true

-- Behaviour
o.hidden = true
o.errorbells = false
o.backspace = "indent,eol,start"
o.autochdir = false
o.iskeyword:append("-")
o.path:append("**")
o.selection = "exclusive"
o.mouse = "a"
o.clipboard:append("unnamedplus")
o.modifiable = true
o.encoding = "UTF-8"
