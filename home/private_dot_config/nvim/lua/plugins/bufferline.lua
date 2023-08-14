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
                        fill = {
                            bg = mocha.mantle,
                        },
                        buffer_selected = {
                            bg = mocha.base,
                        },
                        indicator_selected = {
                            fg = mocha.mauve,
                            bg = mocha.base,
                        },
                        close_button_selected = {
                            bg = mocha.base,
                        },
                        modified = {
                            fg = mocha.lavender,
                            bg = mocha.mantle,
                        },
                        modified_selected = {
                            fg = mocha.lavender,
                            bg = mocha.base,
                        },
                        separator = {
                            bg = mocha.mantle,
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

