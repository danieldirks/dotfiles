local config = {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "mocha",
        background = {
            light = "latte",
            dark = "mocha",
        },
        transparent_background = false,
        term_colors = false,
        integrations = {
            neotree = true,
            treesitter = true,
            telescope = {
                enabled = true,
                style = "nvchad"
            },
            which_key = false,
        },
    },
    init = function() vim.cmd.colorscheme("catppuccin-mocha") end
}

return config
