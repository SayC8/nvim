require("vim._core.ui2").enable({})

require("options")
require("keymaps")

require("pack")

pcall(vim.cmd.colorscheme, "kanagawa-dragon")
