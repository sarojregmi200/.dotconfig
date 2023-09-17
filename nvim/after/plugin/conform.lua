local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd" } },
	},
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*",
		callback = function(args)
			conform.format({ bufnr = args.buf })
		end,
	}),
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

vim.keymap.set("n", "<c-j>", function()
	conform.format()
end, opts)
