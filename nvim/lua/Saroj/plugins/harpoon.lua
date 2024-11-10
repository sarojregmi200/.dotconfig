return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add files to harpoon ui" })

		vim.keymap.set("n", "<C-p>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open harpoon Ui" })

		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end, { desc = "Move to first file harpoon" })
		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(2)
		end, { desc = "Move to second file harpoon" })
		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():select(3)
		end, { desc = "Move to third file harpoon" })
		vim.keymap.set("n", "<C-l>", function()
			harpoon:list():select(4)
		end, { desc = "Move to Fourth file harpoon" })
	end,
}
