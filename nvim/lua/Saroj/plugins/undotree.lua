return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>h", vim.cmd.UndotreeToggle, { desc = "Space [h]istory UndotreeToggle" })
	end,
}
