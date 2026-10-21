vim.g.mapleader = " "

vim.keymap.set("n", "<leader>o", "<cmd>update<cr><cmd>source<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>update<cr>")
vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-c>", ":nohl<cr>", { silent = true })

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "C-d", "<C-d>zz")
vim.keymap.set("n", "C-u", "<C-u>zz")

vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<cr>")

vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>")

--- Emacs styles compile command ---
local last_compile_cmd = "make -k"

local function emacs_compile()
    -- Promt user for command, defaults to last used command
    vim.ui.input({
        prompt = "Compile command: ",
        default = last_compile_cmd,
    }, function(input)
        if not input or input == "" then return end
        last_compile_cmd = input

        -- Clear current quickfix list
        vim.fn.setqflist({}, "r")

        -- Open the quickfix window at the bottom
        vim.cmd("copen")

        -- Run the command asynchronously
        vim.fn.jobstart(input, {
            stdout_buffered = false,
            stderr_buffered = false,
            on_stdout = function(_, data)
                if data then
                    vim.fn.setqflist({}, "a", { lines = data })
                end
            end,
            on_stderr = function(_, data)
                if data then
                    vim.fn.setqflist({}, "a", { lines = data })
                end
            end,
            on_exit = function(_, exit_code)
                local status = (exit_code == 0) and "finished" or ("exited abnormally with code " .. exit_code)
                vim.fn.setqflist({}, "a", { title = input, lines = { "Compilation " .. status } })
            end,
        })
    end)
end

vim.keymap.set("n", "<leader>c", emacs_compile, { desc = "Emacs-style Compile" })

-- Navigate compilation errors/warnings
vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Next compilation error" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Previous compilation error" })
vim.keymap.set("n", "<Leader>cq", "<cmd>copen<CR>", { desc = "Open compilation window" })
