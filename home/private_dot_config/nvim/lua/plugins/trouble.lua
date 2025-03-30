return {
    {
        -- quickfix diagnostics
        -- https://github.com/folke/trouble.nvim
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        init = function()
            vim.keymap.set("n", "<leader>q", ":Trouble<cr>", { desc = "Toggle Trouble list" })
        end,
        opts = {
            use_diagnostic_signs = true,
        },
    },
}
