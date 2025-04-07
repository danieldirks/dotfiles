return {
    {
        -- git ui for neovim
        -- https://github.com/NeogitOrg/neogit
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "sindrets/diffview.nvim",
        },
        cmd = {
            "Neogit"
        },
        keys = {
            { "<leader>g", ":Neogit<cr>", desc = "neogit" },
        },
        opts = {
            signs = {
                hunk = { "", "" },
                item = { "", "" },
                section = { "", "" },
            },
        }
    },

    {
        -- git gutter signs
        -- https://github.com/lewis6991/gitsigns.nvim
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
            current_line_blame = true,
        },
    },

    {
        -- https://github.com/sindrets/diffview.nvim
        "sindrets/diffview.nvim",
    },
}
