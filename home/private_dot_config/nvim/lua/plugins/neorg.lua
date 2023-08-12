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
            ["core.defaults"] = {},  -- default config
            ["core.concealer"] = {},  -- icons
            ["core.dirman"] = {  -- workspaces
                config = {
                    workspaces = {
                        home = "~/Notes/home",
                        work = "~/Notes/work",
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
        },
    },
}

return config
