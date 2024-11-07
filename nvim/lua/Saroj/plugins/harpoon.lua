return {
	"theprimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add files to harpoon ui" })
		vim.keymap.set("n", "<C-p>", ui.toggle_quick_menu, { desc = "Open harpoon Ui" })

		vim.keymap.set("n", "<C-h>", function()
			ui.nav_file(1)
		end, { desc = "Move to first file harpoon" })
		vim.keymap.set("n", "<C-j>", function()
			ui.nav_file(2)
		end, { desc = "Move to second file harpoon" })
		vim.keymap.set("n", "<C-k>", function()
			ui.nav_file(3)
		end, { desc = "Move to third file harpoon" })
		vim.keymap.set("n", "<C-l>", function()
			ui.nav_file(4)
		end, { desc = "Move to Fourth file harpoon" })
	end,
}
