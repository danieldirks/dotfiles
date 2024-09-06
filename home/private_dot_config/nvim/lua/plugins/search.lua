return {
    {
        -- telescope.nvim https://github.com/nvim-telescope/telescope.nvim
        -- search popup
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        init = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find file' })
            vim.keymap.set('n', '<leader>fF', builtin.live_grep, { desc = 'Find file content' })
            vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Find git file' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffer' })
            vim.keymap.set('n', '<leader>fw', ':Telescope find_files search_dirs=~/notes<cr>', { desc = 'Find note' })
            vim.keymap.set('n', '<leader>fW', ':Telescope live_grep search_dirs=~/notes<cr>', { desc = 'Find note content' })
        end,
    },

    {
        -- telescope-fzf-native.nvim https://github.com/nvim-telescope/telescope-fzf-native.nvim
        -- fzf implementation for telescope
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },

    {
        -- telescope-ui-select.nvim https://github.com/nvim-telescope/telescope-ui-select.nvim
        -- replace select menu (vim.ui.select) with telescope
        "nvim-telescope/telescope-ui-select.nvim",
        init = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end,
    },
}
