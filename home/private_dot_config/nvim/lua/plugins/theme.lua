return {
    {
        -- catppuccin mocha color theme
        -- https://github.com/catppuccin/nvim
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        init = function() vim.cmd.colorscheme("catppuccin-mocha") end,
        opts = {
            flavour = "mocha",
            background = {
                light = "latte",
                dark = "mocha",
            },
            transparent_background = false,
            term_colors = true,
            integrations = {
                alpha = true,
                cmp = true,
                gitsigns = true,
                lsp_trouble = true,
                mason = true,
                native_lsp = {
                    enabled = true,
                },
                neotree = true,
                telescope = {
                    enabled = true,
                    style = "nvchad"
                },
                treesitter = true,
                vimwiki = true,
                which_key = true,
            },
            highlight_overrides = {
                mocha = function(mocha)
                    return {
                        TroubleNormal = { bg = mocha.base },
                    }
                end,
            }
        },
    },
}
