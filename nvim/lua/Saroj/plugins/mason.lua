return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- setting up mason
    local mason = require("mason")
    mason.setup({})

    -- setting up the mason-lspconfig, it bridges the gap between lsp config and
    -- mason, creating a nice system where we can specify items from nvim-lspconfig to
    -- be preinstalled. And included in mason. And translates the mason package names to the
    -- actual lsp servers names.
    local mason_lspconfig = require("mason-lspconfig")

    -- These are the lsp servers that i want to be preinstalled.
    local servers = {
      lua_ls = {},
      ts_ls = {},
      emmet_ls = {},
      tailwindcss = {},
      cssls = {},
      eslint = {},
      bashls = {},
      jqls = {},
      clangd = {},
      gopls = {},
      intelephense = {},
    }

    local servers_names = vim.tbl_keys(servers or {});

    mason_lspconfig.setup({
      ensure_installed = servers_names,
      automatic_installation = true,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          local lspconfig = require("lspconfig")
          local capabilities = vim.lsp.protocol.make_client_capabilities()

          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})

          lspconfig[server_name].setup(server);
        end,
      }
    })
  end,
}
