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
            current_line_blame = true,
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
        tag = "v0.0.1",  -- wait for nvim 0.10.0
        init = function()
            vim.keymap.set("n", "<leader>g", ":Neogit<cr>", { desc = "Open Neogit" })
        end,
        config = true,
        opts = {
            signs = {
                hunk = { "", "" },
                item = { "", "" },
                section = { "", "" },
            },
        }
    },

    {
        -- diffview.nvim https://github.com/sindrets/diffview.nvim
        "sindrets/diffview.nvim",
    },
}
