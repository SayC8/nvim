local o = vim.opt

o.termguicolors = true
o.number = true
o.relativenumber = true
o.cursorline = true
o.signcolumn = "yes"
o.colorcolumn = "80"
o.showmode = false
o.splitbelow = true
o.splitright = true


o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.autoindent = true
o.smartindent = true
o.wrap = false

o.scrolloff = 10
o.sidescrolloff = 10

o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

o.completeopt = "fuzzy,menuone,noinsert"
o.pumheight = 10
o.pumblend = 10
o.winblend = 0
o.conceallevel = 0
o.concealcursor = ""
o.lazyredraw = true
o.synmaxcol = 300

o.backup = false
o.swapfile = false
o.undofile = true
o.undodir = vim.fn.expand("~/.vim/undodir/")
o.updatetime = 300
o.timeoutlen = 500
o.autoread = true
o.autowrite = false

o.hidden = true
o.errorbells = false
o.backspace = "indent,eol,start"
o.autochdir = false
o.path:append("**")
o.selection = "exclusive"
o.mouse = "a"
o.clipboard:append("unnamedplus")
o.modifiable = true
o.encoding = "UTF-8"
