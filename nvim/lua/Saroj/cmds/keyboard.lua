-- mapping the vim diagnonistics
vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.config({ float = { border = "single" } })
	vim.diagnostic.open_float()
end, { desc = "Opens the error diagnostic float" })

vim.keymap.set("n", "d[", function()
	vim.diagnostic.config({ float = { border = "single" } })
	vim.diagnostic.jump({
		count = -1,
		float = true,
	})
end, { desc = "moves to previous vim  diagnostic float" })

vim.keymap.set("n", "d]", function()
	vim.diagnostic.config({ float = { border = "single" } })
	vim.diagnostic.jump({
		count = 1,
		float = true,
	})
end, { desc = "moves to next vim  diagnostic float" })

local function get_deduplicated_jumplist()
	-- Get current directory once
	local current_dir = vim.fn.getcwd()

	-- Get jumplist and create a reverse lookup for faster buffer name access
	local jumps = vim.fn.getjumplist()[1]
	local buf_names = {}
	local file_positions = {}

	-- Process jumps in reverse order, but get buffer names only once
	for i = #jumps, 1, -1 do
		local jump = jumps[i]
		local bufnr = jump.bufnr

		-- Cache buffer names for faster lookup
		if not buf_names[bufnr] then
			buf_names[bufnr] = vim.api.nvim_buf_get_name(bufnr)
		end

		local bufname = buf_names[bufnr]
		if vim.startswith(bufname, current_dir) and not file_positions[bufname] then
			file_positions[bufname] = {
				bufnr = bufnr,
				lnum = jump.lnum,
				col = jump.col,
				index = i,
			}
		end
	end

	-- Preallocate table size for better performance
	local unique_jumps = {}
	for _, pos in pairs(file_positions) do
		unique_jumps[#unique_jumps + 1] = pos
	end

	-- Use stable sort
	table.sort(unique_jumps, function(a, b)
		return a.index > b.index
	end)

	return unique_jumps
end

-- Cache the jump list between jumps
local cached_jumps = nil
local custom_jump_pos = 1

local function jump_to_unique_prev()
	if not cached_jumps then
		cached_jumps = get_deduplicated_jumplist()
	end

	if #cached_jumps == 0 then
		print("No jumps available")
		return
	end

	if custom_jump_pos <= #cached_jumps then
		local jump = cached_jumps[custom_jump_pos]
		vim.api.nvim_set_current_buf(jump.bufnr)
		vim.api.nvim_win_set_cursor(0, { jump.lnum, jump.col })
		custom_jump_pos = custom_jump_pos + 1
		print(custom_jump_pos, "/", #cached_jumps)
	else
		print("Reached end of jumplist")
	end
end

local function jump_to_unique_next()
	if not cached_jumps then
		cached_jumps = get_deduplicated_jumplist()
	end

	if #cached_jumps == 0 then
		print("No jumps available")
		return
	end

	if custom_jump_pos > 1 then
		custom_jump_pos = custom_jump_pos - 1
		local jump = cached_jumps[custom_jump_pos]
		print(custom_jump_pos, "/", #cached_jumps)
		vim.api.nvim_set_current_buf(jump.bufnr)
		vim.api.nvim_win_set_cursor(0, { jump.lnum, jump.col })
	else
		print("At start of jumplist")
	end
end

-- Reset cache when new jumps are added
local function reset_jump_cache()
	cached_jumps = nil
	custom_jump_pos = 1
end

-- Set up the keymaps
vim.keymap.set("n", "<C-f>", jump_to_unique_next, { noremap = true, silent = true })
vim.keymap.set("n", "<C-b>", jump_to_unique_prev, { noremap = true, silent = true })

-- Reset cache when new jumps might be added
vim.api.nvim_create_autocmd({ "BufEnter", "CursorMoved" }, {
	callback = reset_jump_cache,
})
