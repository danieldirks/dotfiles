-- https://github.com/nvim-telescope/telescope.nvim

local options = {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.2',
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Grep files" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffer" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help pages" })
    end
}

return options

