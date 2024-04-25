return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,

	-- setting the concellevel only in markdown files
	ft = { "markdown", "text" },
	-- event = {
	-- 	"BufReadPre " .. vim.fn.expand("~") .. "/Documents/Notes/**.md",
	-- 	"BufNewFile " .. vim.fn.expand("~") .. "/Documents/Notes/**.md",
	-- },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Notes",
				path = "~/Documents/Notes/",
			},
		},
	},

	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "personal",
					path = "~/Documents/Notes/personal/",
				},
				{
					name = "configuration",
					path = "~/Documents/Notes/configurations/",
				},
				{
					name = "Projects",
					path = "~/Documents/Notes/projects",
				},
			},
			ui = {
				enable = true,
				checkboxes = {
					---@diagnostic disable: missing-fields
					[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
					["x"] = { char = "", hl_group = "ObsidianDone" },
					[">"] = { char = "", hl_group = "ObsidianRightArrow" },
					["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				},
			},
		})
		-- setting the concellevel for rendering markdown efficiently
		vim.api.nvim_set_option_value("conceallevel", 2, {})
	end,
}
