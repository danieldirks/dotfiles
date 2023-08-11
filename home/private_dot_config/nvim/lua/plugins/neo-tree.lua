local config = {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    opts = {
        filesystem = {
            follow_current_file = {
                enabled = true,
                leave_dirs_open = false,
            },
            hijack_netrw_behavior = "open_default",
        },
    },
}

return config
