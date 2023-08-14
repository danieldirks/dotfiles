-- https://github.com/nvim-neorg/neorg

local config = {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter"
    },
    opts = {
        load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.dirman"] = {
                config = {
                    workspaces = {
                        home = "~/Notes/home",
                    },
                    default_workspace = "home",
                    open_last_workspace = true,
                },
            },
            ["core.journal"] = {
                config = {
                    strategy = "flat"  -- flat file names
                },
            },
            ["core.summary"] = {},
        },
    },
}

return config
