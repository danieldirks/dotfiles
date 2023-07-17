return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "macchiato",
        background = {
            light = "latte",
            dark = "macchiato",
        },
        transparent_background = true
    },
    init = function() vim.cmd.colorscheme("catppuccin-macchiato") end
}
