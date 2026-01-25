return {
    {
        "RRethy/base16-nvim",
        priority = 1000,
        config = function()
            require("base16-colorscheme").setup({
                base00 = "#181216",
                base01 = "#181216",
                base02 = "#9e929b",
                base03 = "#9e929b",
                base04 = "#ffeffa",
                base05 = "#fff8fd",
                base06 = "#fff8fd",
                base07 = "#fff8fd",
                base08 = "#ff9fa7",
                base09 = "#ff9fa7",
                base0A = "#ffc4ef",
                base0B = "#bfffa5",
                base0C = "#ffdff6",
                base0D = "#ffc4ef",
                base0E = "#ffcef1",
                base0F = "#ffcef1",
            })
            require("base16-colorscheme").with_config({
                telescope = true,
                indentblankline = true,
                notify = true,
                transparent = true,
            })

            vim.api.nvim_set_hl(0, "Visual", {
                bg = "#9e929b",
                fg = "#fff8fd",
                bold = true,
            })
            vim.api.nvim_set_hl(0, "Statusline", {
                bg = "#ffc4ef",
                fg = "#181216",
            })
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#9e929b" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffdff6", bold = true })

            vim.api.nvim_set_hl(0, "Statement", {
                fg = "#ffcef1",
                bold = true,
            })
            vim.api.nvim_set_hl(0, "Keyword", { link = "Statement" })
            vim.api.nvim_set_hl(0, "Repeat", { link = "Statement" })
            vim.api.nvim_set_hl(0, "Conditional", { link = "Statement" })

            vim.api.nvim_set_hl(0, "Function", {
                fg = "#ffc4ef",
                bold = true,
            })
            vim.api.nvim_set_hl(0, "Macro", {
                fg = "#ffc4ef",
                italic = true,
            })
            vim.api.nvim_set_hl(0, "@function.macro", { link = "Macro" })

            vim.api.nvim_set_hl(0, "Type", {
                fg = "#ffdff6",
                bold = true,
                italic = true,
            })
            vim.api.nvim_set_hl(0, "Structure", { link = "Type" })

            vim.api.nvim_set_hl(0, "String", {
                fg = "#bfffa5",
                italic = true,
            })

            vim.api.nvim_set_hl(0, "Operator", { fg = "#ffeffa" })
            vim.api.nvim_set_hl(0, "Delimiter", { fg = "#ffeffa" })
            vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "Delimiter" })
            vim.api.nvim_set_hl(0, "@punctuation.delimiter", { link = "Delimiter" })

            vim.api.nvim_set_hl(0, "Comment", {
                fg = "#9e929b",
                italic = true,
            })

            local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
            if not _G._matugen_theme_watcher then
                local uv = vim.uv or vim.loop
                _G._matugen_theme_watcher = uv.new_fs_event()
                _G._matugen_theme_watcher:start(
                    current_file_path,
                    {},
                    vim.schedule_wrap(function()
                        local new_spec = dofile(current_file_path)
                        if new_spec and new_spec[1] and new_spec[1].config then
                            new_spec[1].config()
                            print("Theme reload")
                        end
                    end)
                )
            end
        end,
    },
}
