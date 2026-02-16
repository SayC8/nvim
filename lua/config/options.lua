----------------------------------------
--- OPTIONS
----------------------------------------
local opt = vim.opt

-- Appearance & UI
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Show relative line numbers (great for motions)
opt.signcolumn = "yes"    -- Always show the sign column (prevents text shift)
opt.cursorline = true     -- Highlight the text line containing the cursor
opt.laststatus = 3        -- Global statusline (one bar for all windows)
opt.showmode = false      -- Don't show mode (statusline handles it)
opt.pumheight = 10        -- Maximum items in completion popup
opt.cmdheight = 0         -- Hide cmdline when no in use
opt.smoothscroll = true   -- Smoothly scroll wrapped lines (v0.10+)
opt.scrolloff = 8
opt.sidescrolloff = 12
opt.winborder = "rounded"

-- Behavior & Performance
opt.updatetime = 300          -- Faster completion and diagnostic updates
opt.timeoutlen = 300          -- Mapping timeout (crucial for mini.clue)
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.mouse = "a"               -- Enable mouse support
opt.undofile = true           -- Persistent undo (survives restarts)
opt.swapfile = false          -- This is just annoying
opt.confirm = true            -- Confirm before quitting unsaved changes

-- Tabs & Indentation
opt.expandtab = true   -- Use spaces instead of tabs
opt.shiftwidth = 4     -- Size of an indent
opt.tabstop = 4        -- Number of spaces tabs count for
opt.softtabstop = 4
opt.shiftround = true  -- Round indent to multiple of shiftwidth
opt.smartindent = true -- Insert indents automatically
opt.wrap = false       -- Disable line wrapping

-- Windows & Splitting
opt.splitright = true -- Put vertical splits to the right
opt.splitbelow = true -- Put horizontal splits to the bottom
opt.winminwidth = 5   -- Prevent tiny, unusable splits

-- Search
opt.smartcase = true       -- Case-sensitive if search contains uppercase
opt.ignorecase = true      -- Ignore case in search patterns
opt.incsearch = true       -- Show search results while typing
opt.inccommand = "nosplit" -- Live preview for :substitute in the buffer
opt.hlsearch = true        -- Highlight all matches on previous search

-- Completion (Omnifunc/Native)
-- menuone: popup even for one match | noselect: don't select | noinsert: don't change text
opt.completeopt = { "menuone", "noselect", "noinsert" }

-- UI Characters
opt.list = true -- Show invisible characters
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

----------------------------------------
--- V0.12 SPECIFIC DIAGNOSTICS & HINTS
----------------------------------------
-- This configures how LSP info looks globally
vim.diagnostic.config({
    virtual_text = { prefix = '●' }, -- Small dots for errors in-line
    update_in_insert = false, -- Don't show errors while typing
    severity_sort = true, -- Sort by severity so Errors show first
})

-- Enable Inlay Hints by default (v0.12 native feature)
-- This shows type info/parameter names in the buffer
if vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(false)
end
