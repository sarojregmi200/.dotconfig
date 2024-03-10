return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,

	ft = { "markdown" },
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
}
