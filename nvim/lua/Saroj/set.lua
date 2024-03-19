vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.winblend = 100

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true -- auto indent

-- line wrap
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- changing the cursor to block
vim.opt.guicursor = ""

-- cursor line and signline config
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- setting the concellevel for rendering markdown efficiently
-- setting the concellevel only in markdown files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	desc = "Setting conceal level for better preview Markdown files",
	pattern = { "*.txt", "*.md" },
	group = vim.api.nvim_create_augroup("set-conceallevel-md", { clear = true }),
	callback = function()
		vim.api.nvim_set_option_value("conceallevel", 2, {})
	end,
})
