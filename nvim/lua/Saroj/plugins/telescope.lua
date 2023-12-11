return {
    "nvim-telescope/telescope.nvim",
    version = "0.1.2",
    dependencies = { 
        "nvim-lua/plenary.nvim", 
        {"nvim-telescope/telescope-fzf-native.nvim", build="make"},
    },
    config = function() 
        local telescope = require("telescope")
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')
        
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move up
                        ["<C-j>"] = actions.move_selection_next -- move down
                    }
                }
            }
        })
        
        telescope.load_extension("fzf")

        vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>sg', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ss', "<cmd>Telescope live_grep<cr>", {desc = "find string in current working directory"})
        vim.keymap.set('n', '<leader>suc', "<cmd>Telescope grep_string<cr>", {desc = "Find the string under the cursor"})
    end
} 
