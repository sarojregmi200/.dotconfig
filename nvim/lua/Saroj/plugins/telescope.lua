return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",

        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
        local telescope = require("telescope")
        local telescope_actions = require("telescope.actions")
        local telescope_layout_actions = require("telescope.actions.layout")
        local telescope_builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                sorting_strategy = "descending",
                mappings = {
                    i = {
                        ["<esc>"] = telescope_actions.close,
                        ["<C-j>"] = telescope_actions.move_selection_next,
                        ["<C-k>"] = telescope_actions.move_selection_previous,
                        ["<M-p>"] = telescope_layout_actions.toggle_preview,
                    },
                    n = {
                        ["<M-p>"] = telescope_layout_actions.toggle_preview,
                    }
                },
            },
            pickers = {
                find_files = {
                    -- also searching for the hidden files
                    find_command = {
                        "rg",
                        "--files",
                        "--hidden",
                        "--glob",
                        "!**/.git/*",
                    },
                },
            },
        })

        -- loading the extensions
        telescope.load_extension("fzf")

        -- Writing the keymaps
        vim.keymap.set("n", "<leader>sf", telescope_builtin.find_files, {
            desc = "[S]earch [F]iles",
        })
        vim.keymap.set("n", "<leader>ss", telescope_builtin.live_grep, {
            desc = "[S]earch [S]tring in the project.",
        })
        vim.keymap.set("n", "<leader>sk", telescope_builtin.keymaps, {
            desc = "[S]earch [K]ey maps",
        })
        vim.keymap.set("n", "<leader>sd", telescope_builtin.diagnostics, {
            desc = "[S]earch [D]iagnostics",
        })

        vim.keymap.set("n", "<leader>sb", telescope_builtin.builtin, {
            desc = "[S]earch [B]uiltin functions",
        })

        vim.keymap.set("n", "<leader>sh", telescope_builtin.help_tags, {
            desc = "[S]earch [H]elp tags",
        })

        vim.keymap.set("n", "<leader>st", telescope_builtin.treesitter, {
            desc = "[S]earch  [T]reesitter",
        })

        vim.keymap.set("n", "<leader>sr", function()
            telescope_builtin.resume()
        end, {
            desc = "[S]earch  [T]reesitter",
        })
    end,
}
