return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move up
						["<C-j>"] = actions.move_selection_next, -- move down
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- keymaps
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sg", builtin.git_files, { desc = "[S]earch [G]it files" })
		vim.keymap.set(
			"n",
			"<leader>ss",
			"<cmd>Telescope live_grep<cr>",
			{ desc = "find string in current working directory" }
		)
		vim.keymap.set(
			"n",
			"<leader>suc",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "Find the string under the cursor" }
		)
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search the nvim help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search the Keymaps" })
		vim.keymap.set("n", "<leader>sd", builtin.keymaps, { desc = "Search the diagnostics" })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

	end,
}
