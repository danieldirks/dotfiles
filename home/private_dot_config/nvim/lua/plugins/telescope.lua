return {
    {
        -- search plugin
        -- https://github.com/nvim-telescope/telescope.nvim
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        init = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>f', '', { desc = 'find' })
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'file' })
            vim.keymap.set('n', '<leader>fF', builtin.live_grep, { desc = 'file content' })
            vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'git file' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'buffer' })
            vim.keymap.set('n', '<leader>fw', ':Telescope find_files search_dirs=~/notes<cr>', { desc = 'note' })
            vim.keymap.set('n', '<leader>fW', ':Telescope live_grep search_dirs=~/notes<cr>', { desc = 'note content' })
        end,
    },

    {
        -- fzf implementation for telescope
        -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },

    {
        -- replace select menu (vim.ui.select) with telescope
        -- https://github.com/nvim-telescope/telescope-ui-select.nvim
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
