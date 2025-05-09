-- highlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "highlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Vertical Column in files with indenting
-- TODO: Work on this to make it work properly
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.yml", "*.yaml", "*.py" },
    desc = "Activating Vertical Highlight in files that require indenting",
    group = vim.api.nvim_create_augroup("Vertical-highlight", { clear = true }),
    callback = function()
        vim.opt.cursorcolumn = true
        vim.api.nvim_set_hl(0, "hl-CursorColumn", { bg = "#222222" })
    end,
})

-- These are the auto commands that run after
-- the lspattaches and provide some good shortcuts and keymaps
-- for making the editing experience great again
-- And offcourse starting the completion engine
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        map("<leader>gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map("<leader>gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        map("<leader>td", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
        map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("<leader>gd", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                callback = vim.lsp.buf.clear_references,
            })
        end
    end,
})
