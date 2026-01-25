-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd("colorscheme base16-catppuccin-mocha")
-- vim.cmd("colorscheme base16-gruvbox-dark")

-- vim.cmd("TransparentEnable")
vim.cmd("TransparentDisable")

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
