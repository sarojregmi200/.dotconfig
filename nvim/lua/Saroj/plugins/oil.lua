return {
	"stevearc/oil.nvim",
	opts = {},
	config = function()
		require("oil").setup({
			default_file_explorer = true,

			columns = {
				"icon",
				"permissions",
				"size",
			},
			win_options = {
				wrap = false,
				signcolumn = "no",
				cursorcolumn = false,
			},

			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = false,
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
