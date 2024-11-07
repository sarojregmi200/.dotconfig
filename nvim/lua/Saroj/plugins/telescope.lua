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
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "respect_case", -- or "ignore_case" or "respect_case"
				},
			},
			defaults = {
				path_display = { "truncate" },
				file_ignore_patterns = {
					"node_modules",
					".git",
				},
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
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
	end,
}
