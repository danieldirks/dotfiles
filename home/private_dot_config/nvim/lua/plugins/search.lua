return {
    {
        -- telescope.nvim https://github.com/nvim-telescope/telescope.nvim
        -- search popup
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        init = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find file' })
            vim.keymap.set('n', '<leader>fF', builtin.live_grep, { desc = 'Find file content' })
            vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Find git file' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffer' })
            vim.keymap.set('n', '<leader>fw', ':Telescope find_files search_dirs=~/Notes<cr>', { desc = 'Find note' })
            vim.keymap.set('n', '<leader>fW', ':Telescope live_grep search_dirs=~/Notes<cr>', { desc = 'Find note content' })
        end
    },

    {
        -- telescope-fzf-native.nvim https://github.com/nvim-telescope/telescope-fzf-native.nvim
        -- fzf implementation for telescope
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
}
