return {
    {
        -- quickfix diagnostics
        -- https://github.com/folke/trouble.nvim
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>q", "<cmd>Trouble<cr>", desc = "trouble list" },
        },
        opts = {
            use_diagnostic_signs = true,
        },
    },
}
