return {
    {
        -- gitsigns.nvim https://github.com/lewis6991/gitsigns.nvim
        -- git gutter signs
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add          = { text = '│' },
                change       = { text = '│' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '│' },
                untracked    = { text = '┆' },
            },
        },
    },

    {
        -- neogit https://github.com/NeogitOrg/neogit
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "sindrets/diffview.nvim",
        },
        config = true
    },

    {
        -- diffview.nvim https://github.com/sindrets/diffview.nvim
        "sindrets/diffview.nvim",
    },
}
