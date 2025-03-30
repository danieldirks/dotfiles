return {
    {
        -- key mappings help popup
        -- https://github.com/folke/which-key.nvim
        "folke/which-key.nvim",
        init = function()
            vim.opt.timeout = true
            vim.opt.timeoutlen = 300
        end,
        opts = {},
    },
}
