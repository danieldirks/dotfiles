return {
    {
        -- search plugin
        -- https://github.com/nvim-telescope/telescope.nvim
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        init = function()
            local builtin = require('telescope.builtin')

            -- notes directory from the vimwiki config
            local function notes_dir()
                local list = vim.g.vimwiki_list or {}
                local path = list[1] and list[1].path or '~/notes'
                return vim.fn.resolve(vim.fn.expand(path))
            end

            vim.keymap.set('n', '<leader>f', '', { desc = 'find' })
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'file' })
            vim.keymap.set('n', '<leader>fF', builtin.live_grep, { desc = 'file content' })
            vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'git file' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'buffer' })
            vim.keymap.set('n', '<leader>fw', function()
                builtin.find_files({ cwd = notes_dir() })
            end, { desc = 'note' })
            vim.keymap.set('n', '<leader>fW', function()
                builtin.live_grep({ cwd = notes_dir() })
            end, { desc = 'note content' })
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
