-- Mod for keymaps <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- When using `set linebreak`
vim.keymap.set({ "n", "x" }, "j", function()
	return vim.v.count > 0 and "j" or "gj"
end, { noremap = true, expr = true })
vim.keymap.set({ "n", "x" }, "k", function()
	return vim.v.count > 0 and "k" or "gk"
end, { noremap = true, expr = true })
vim.keymap.set({ "n", "x" }, "$", function()
	return vim.v.count > 0 and "$" or "g$"
end, { noremap = true, expr = true })
vim.keymap.set({ "n", "x" }, "0", function()
	return vim.v.count > 0 and "0" or "g0"
end, { noremap = true, expr = true })

-- File Exit
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- vim.keymap.set("n", "-", ":Ex<CR>")

-- Tab / Shift-Tab in visual mode
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- Move selected block with auto indenting

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move Up/Down while also centering
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Combine line under with current into one line (staying in place)
vim.keymap.set("n", "J", "mzJ`z")

-- Search terms (/) are stayed in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste while moving replaced content into the void buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Make a copy in the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy in system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line in system clipboard" })

-- Removing this mapping
vim.keymap.set("n", "Q", "<nop>")

-- Run LSP Formatter
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})

-- Quickfix navigation
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Rename all occurances of hovered word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current file executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
