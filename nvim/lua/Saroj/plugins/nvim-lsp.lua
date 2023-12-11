return {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    config = function()
        local action = function(_, _)
            vim.keymap.set("n", '<leader>sn', vim.lsp.buf.rename, {})
        end
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("lspconfig").lua_ls.setup {
            on_attach = action,
            capabilities = capabilities,
        }
    end
}
