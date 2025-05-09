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
