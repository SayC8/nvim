local map = vim.keymap.set
vim.g.mapleader = " "

-- Files
map("n", "<leader>e", ":Oil --float<CR>", { desc = "Open file explorer" })
map("n", "<leader>ff", ":find ", { desc = "Find file" })
map("n", "<leader>w", ":w<CR>", { desc = "Save current file" })
map("n", "<leader>o", ":so<CR>", { desc = "Source current file" })

-- Terminal
map("n", "<leader>t", ":term ", { desc = "Run command in terminal" })

-- LSP etc
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })

-- Y to EOL
map("n", "Y", "y$", { desc = "Yank to end of line" })

-- Center screen when jumping
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- Buffers
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bc", ":bdelete<CR>", { desc = "Delete current buffer" })

-- Splitting and resizing
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Move lines up/down
map("n", "<A-j>", ":m .+1<CR>", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

-- Better indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent left and reselect" })

-- Better J behaviour
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Compilation/Running
map("n", "<F7>",
  function()
    local filename = vim.fn.expand("%")
    local basename = vim.fn.expand("%:r")
    local filetype = vim.bo.filetype
    local cmd = nil

    if filetype == "lua" then
      cmd = "term lua " .. filename
    elseif filetype == "go" then
      cmd = "term go run"
    elseif filetype == "c" then
      local makefile = io.open("Makefile", "r")
      local buildsh = io.open("build.sh", "r")
      if makefile then
        cmd = "term make"
        makefile:close()
      elseif buildsh then
        cmd = "term ./build.sh"
        buildsh:close()
      else
        print("No Makefile or build.sh found!")
        return
      end
    end

    if cmd then
      vim.cmd("w|split|resize 12|" .. cmd)
      vim.cmd("$")
    else
      print("No compilation command defined for filetype: '" .. filetype .. "'")
    end
  end,
  { desc = "Compile/Run" })
