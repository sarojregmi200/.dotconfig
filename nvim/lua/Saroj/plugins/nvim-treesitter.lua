return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-refactor",
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		---@diagnostic disable-next-line: missing-fields
		configs.setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "ruby" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			refactor = {
				highlight_definitions = { enable = true, clear_on_cursor_move = true },
				smart_rename = { enable = true },
				navigation = { enable = true },
				keymaps = {
					list_definitions = "<leader>ld",
					-- list_definitions_toc = "gO",
					goto_next_usage = "gnu",
					goto_previous_usage = "gpu",
					smart_rename = "<leader>srn",
				},
			},
		})

		local context = require("treesitter-context")
		context.setup({
			max_lines = 20,
			trim_scope = "outer",
		})

		vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#1e1e2e" })
	end,
}
