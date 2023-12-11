-- remaping the space key as leader
vim.g.mapleader = " "

-- remaping the netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- remaping the esc to jk or kj
vim.keymap.set("i", "kj", "<ESC>")
vim.keymap.set("i", "jk", "<ESC>")

-- mapping the vim keys
vim.keymap.set("n", "<M-h>", "<cmd> TmuxNavigateLeft <CR>")
vim.keymap.set("n", "<M-l>", "<cmd> TmuxNavigateRight <CR>")
vim.keymap.set("n", "<M-j>", "<cmd> TmuxNavigateDown <CR>")
vim.keymap.set("n", "<M-k>", "<cmd> TmuxNavigateUp <CR>")
