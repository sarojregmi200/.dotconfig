-- remaping the space key as leader
vim.g.mapleader = " "

-- remaping the netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- remaping the esc to jk or kj
vim.keymap.set("i", "kj", "<ESC>")
vim.keymap.set("i", "jk", "<ESC>")

-- mapping the system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("x", "<leader>y", '"+y')
vim.keymap.set("x", "<leader>Y", '"+Y')

-- mapping the vim diagnonistics
vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.config({ float = { border = "single" } })
	vim.diagnostic.open_float()
end, { desc = "Opens the error diagnostic float" })
