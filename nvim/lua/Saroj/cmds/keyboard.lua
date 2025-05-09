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

--- open the definition in a new split
vim.keymap.set("n", "gvd", function()
  vim.cmd("rightbelow vsplit")
  vim.lsp.buf.definition()
end, {})

--- open the definition in a new split
vim.keymap.set("n", "ghd", function()
  vim.cmd("rightbelow split")
  vim.lsp.buf.definition()
end, {})

-- vertical split into file explorer
vim.keymap.set("n", "v-", function()
  vim.cmd("rightbelow vsplit")
  vim.cmd("norm -")
end, {})
