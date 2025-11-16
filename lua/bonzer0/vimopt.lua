vim.opt.number = true -- The number line on the left
vim.opt.relativenumber = true -- For relative jumping
vim.opt.wrap = false -- I can always write `:set wrap linebreak` when I need

vim.opt.tabstop = 4 -- Tab size of 4
vim.opt.shiftwidth = 4 -- The size of `>>` and `<<` in normal mode
vim.opt.expandtab = true -- Tabs to spaces
vim.opt.softtabstop = 4
vim.opt.smartindent = true -- Recognition of `C-like` syntax for proper indentation

vim.opt.swapfile = false -- Just don't really like it

vim.opt.backup = false -- Don't create backup files after saving changes
vim.opt.undofile = true -- Use undofiles instead
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false -- Do not highlight every search match
vim.opt.incsearch = true -- Real time highlighting of searches

vim.opt.termguicolors = true -- 24-bit colors

vim.opt.scrolloff = 8 -- Keep 8 lines above and below when jumping
vim.opt.isfname = vim.o.isfname .. ",@-@" -- Adds '@' as valid filename character

vim.opt.updatetime = 50 -- Update time for LSP and autocompletion
vim.opt.signcolumn = "yes" -- A little padding on the left for 'W'
-- vim.opt.colorcolumn = "80" -- Vertical line column at 80

vim.opt.winborder = "rounded" -- Rounded borders for floating winodws
-- vim.opt.listchars["tab"] = "→"

vim.opt.completeopt = { "noselect" }
