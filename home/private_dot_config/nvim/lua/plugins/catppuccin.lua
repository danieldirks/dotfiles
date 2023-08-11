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
        transparent_background = true
    },
    init = function() vim.cmd.colorscheme("catppuccin-macchiato") end
}

return config
