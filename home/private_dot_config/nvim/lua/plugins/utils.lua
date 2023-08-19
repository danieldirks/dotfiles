return {
    {
        -- better-escape.nvim https://github.com/max397574/better-escape.nvim
        -- escaping with key combinations in insert mode
        "max397574/better-escape.nvim",
        opts = {
            mapping = {"jk"},
        },
    },

    {
        -- undotree https://github.com/jiaoshijie/undotree
        "jiaoshijie/undotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        init = function()
            vim.keymap.set("n", "<leader>u", require("undotree").toggle, { noremap = true, silent = true, desc = "Open undotree" })
        end,
        opts = {
            float_diff = false,
            layout = "left_left_bottom",
        },
    },

    {
        -- chezmoi.vim https://github.com/alker0/chezmoi.vim
        -- chezmoi integration
        "alker0/chezmoi.vim",
        lazy = false,
    },


    {
        -- editorconfig-vim https://github.com/editorconfig/editorconfig-vim
        "editorconfig/editorconfig-vim",
        lazy = false,
    },
}
