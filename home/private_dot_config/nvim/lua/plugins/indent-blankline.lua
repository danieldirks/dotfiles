return {
    {
        -- indentation lines
        -- https://github.com/lukas-reineke/indent-blankline.nvim
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = '┆', },
            scope = { show_start = false },
        },
    },
}
