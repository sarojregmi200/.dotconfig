-- remaping the space key as leader
vim.g.mapleader = " "

-- remaping the netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Go to the file explorer" })

-- remaping the esc to jk or kj
vim.keymap.set("i", "kj", "<ESC>", { desc = "Exit the insert mode" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit the insert mode" })

-- mapping the system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to the system clipboard (normal mode)" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Copy to the system clipboard (normal mode)" })
vim.keymap.set("x", "<leader>y", '"+y', { desc = "Copy to the system clipboard (visual mode)" })
vim.keymap.set("x", "<leader>Y", '"+Y', { desc = "Copy to the system clipboard (visual mode)" })

-- mapping the vim diagnonistics
vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.config({ float = { border = "single" } })
	vim.diagnostic.open_float()
end, { desc = "Opens the error diagnostic float" })

vim.keymap.set("n", "d[", function()
	vim.diagnostic.config({ float = { border = "single" } })
	vim.diagnostic.goto_prev()
end, { desc = "moves to previous vim  diagnostic float" })

vim.keymap.set("n", "d]", function()
	vim.diagnostic.config({ float = { border = "single" } })
	vim.diagnostic.goto_next()
end, { desc = "moves to next vim  diagnostic float" })
