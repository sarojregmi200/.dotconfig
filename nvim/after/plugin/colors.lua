-- using the color theme.
color = "catppuccin-macchiato"
vim.cmd.colorscheme(color)

-- making the background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
