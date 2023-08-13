-- https://github.com/akinsho/bufferline.nvim

return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    after = "catppuccin",
    config = function()
        local mocha = require("catppuccin.palettes").get_palette "mocha"
        require("bufferline").setup {
            highlights = require("catppuccin.groups.integrations.bufferline").get {
                styles = {},
                custom = {
                    mocha = {
                        buffer_selected = {
                            bg = mocha.surface0,
                        },
                        indicator_selected = {
                            fg = mocha.mauve,
                            bg = mocha.surface0,
                        },
                        close_button_selected = {
                            bg = mocha.surface0,
                        },
                        modified = {
                            fg = mocha.lavender,
                            bg = mocha.surface0,
                        },
                        modified_selected = {
                            fg = mocha.lavender,
                            bg = mocha.surface0,
                        },
                        separator = {
                            bg = mocha.crust,
                        },
                    },
                },
            },
            options = {
                always_show_bufferline = true,
                color_icons = true,
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count)
                    return "(" .. count .. ")"
                end,
                enforce_regular_tabs = false,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Files",
                        text_align = "center",
                        padding = 0,
                    },
                },
                separator_style = "thin",
                show_buffer_close_icons = true,
                show_buffer_icons = true,
                show_close_icon = true,
                tab_size = 20,
            },
        }
    end,
}

