-- Mapping are keyboard commands or shortcuts
-- That do not require any function definition and are generally
-- short for those which require more configuration or work see
-- ./cmds/keyboard.lua
--
-- remaping the space key as leader
vim.g.mapleader = " "

-- mapping for the file manager
vim.keymap.set("n", "<leader>fl", "<CMD>Oil<CR>", { desc = "Go to the file explorer" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- mapping the system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Copy to the system clipboard (normal mode)" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Copy to the system clipboard (normal mode)" })
vim.keymap.set("x", "<leader>y", '"+y', { desc = "Copy to the system clipboard (visual mode)" })
vim.keymap.set("x", "<leader>Y", '"+Y', { desc = "Copy to the system clipboard (visual mode)" })
