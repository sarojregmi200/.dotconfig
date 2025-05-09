return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		local ts_js_eco = {
			"prettier",
			"prettierd",
			stop_after_first = true,
		}

		conform.setup({
			log_level = vim.log.levels.DEBUG,
			formatters = {
				prettierd = {
					inherit = false,
					command = "prettierd",
					args = { "$FILENAME" },
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				typescriptreact = ts_js_eco,
				javascriptreact = ts_js_eco,
				javascript = ts_js_eco,
				typescript = ts_js_eco,
				json = { "jq" },
			},
			lsp_fallback = true,
		})

		vim.keymap.set("n", "<c-f>", function()
			print("Formatting the file")
			local bufid = vim.api.nvim_get_current_buf()
			conform.format({ bufnr = bufid }, function(err, did_edit)
				if err then
					print("Error occured while formatting the file")
				end

				if did_edit then
					print("File formatted successfully")
				else
					print("Noting to be formatted!!")
				end
			end)
		end, { desc = "Format the current file" })
	end,
}
