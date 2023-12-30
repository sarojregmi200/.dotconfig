-- remaping the space key as leader
vim.g.mapleader = " "

-- remaping the netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- remaping the esc to jk or kj
vim.keymap.set("i", "kj", "<ESC>")
vim.keymap.set("i", "jk", "<ESC>")

-- remaping zoom out and zoom in
vim.api.nvim_set_keymap("n", " zz", "<c-w>_", { noremap = true })
vim.api.nvim_set_keymap("n", " zo", "<c-w>=", { noremap = true })
