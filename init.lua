require("vim._core.ui2").enable({})

require("options")
require("keymaps")

require("pack")

pcall(vim.cmd.colorscheme, "kanagawa-dragon")
-- pcall(vim.cmd.colorscheme, "lunaperche")

-- Sync terminal bg with colorscheme to avoid mistmatch border
local group = vim.api.nvim_create_augroup("TerminalBgSync", { clear = true })

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
    group = group,
    callback = function()
        local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
        local bg = normal and normal.bg

        if bg then
            local hex = string.format("#%06x", bg)
            io.write(string.format("\27]11;%s\7", hex))
        end
    end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    group = group,
    callback = function()
        io.write("\27]111\7")
    end
})
