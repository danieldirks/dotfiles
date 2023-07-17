require("catppuccin").setup({
    flavour = "macchiato",
    background = {
        light = "latte",
        dark = "macchiato",
    },
    transparent_background = true,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    --color_overrides = {},
    --custom_highlights = {},
    --integrations = {},
})
vim.cmd.colorscheme "catppuccin-macchiato"
vim.opt.termguicolors = false