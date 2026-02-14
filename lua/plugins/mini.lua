return {
    "nvim-mini/mini.nvim",
    config = function()
        require("mini.icons").setup()
        require("mini.pairs").setup()
        require("mini.move").setup()
        require("mini.tabline").setup()
        require("mini.statusline").setup()

        require("mini.git").setup()
        require("mini.diff").setup()
        vim.keymap.set("n", "<leader>go", MiniDiff.toggle_overlay, { desc = "Toggle Git Diff Overlay" })

        require("mini.files").setup()
        vim.keymap.set("n", "<leader>e", MiniFiles.open, { desc = "Files" })

        require("mini.pick").setup()
        vim.keymap.set("n", "<leader>pf", ":Pick files<CR>", { desc = "Search Files" })
        vim.keymap.set("n", "<leader>ph", ":Pick help<CR>", { desc = "Search Help" })
        vim.keymap.set("n", "<leader>/", ":Pick grep_live<CR>", { desc = "Live Grep" })

        require("mini.bufremove").setup()
        vim.keymap.set("n", "<leader>bd", MiniBufremove.delete, { desc = "Delete Buffer" })

        local miniclue = require('mini.clue')
        miniclue.setup({
            triggers = {
                -- Leader triggers
                { mode = { 'n', 'x' }, keys = '<Leader>' },

                -- `[` and `]` keys
                { mode = 'n',          keys = '[' },
                { mode = 'n',          keys = ']' },

                -- Built-in completion
                { mode = 'i',          keys = '<C-x>' },

                -- `g` key
                { mode = { 'n', 'x' }, keys = 'g' },

                -- Marks
                { mode = { 'n', 'x' }, keys = "'" },
                { mode = { 'n', 'x' }, keys = '`' },

                -- Registers
                { mode = { 'n', 'x' }, keys = '"' },
                { mode = { 'i', 'c' }, keys = '<C-r>' },

                -- Window commands
                { mode = 'n',          keys = '<C-w>' },

                -- `z` key
                { mode = { 'n', 'x' }, keys = 'z' },
            },

            clues = {
                -- Enhance this by adding descriptions for <Leader> mapping groups
                miniclue.gen_clues.square_brackets(),
                miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.marks(),
                miniclue.gen_clues.registers(),
                miniclue.gen_clues.windows(),
                miniclue.gen_clues.z(),
            },
        })
    end
}
