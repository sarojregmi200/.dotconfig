-- highlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Vertical Column in files with indenting
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.yml", "*.yaml", "*.py" },
	desc = "Activating Vertical Highlight in files that require indenting",
	group = vim.api.nvim_create_augroup("Vertical-highlight", { clear = true }),
	callback = function()
		vim.opt.cursorcolumn = true
		vim.api.nvim_set_hl(0, "hl-CursorColumn", { bg = "#222222" })
	end,
})
