return {
    {
        -- buffer line
        -- https://github.com/akinsho/bufferline.nvim
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        after = "catppuccin",
        config = function()
            local mocha = require("catppuccin.palettes").get_palette "mocha"
            require('bufferline').setup {
                highlights = require("catppuccin.groups.integrations.bufferline").get {
                    styles = {},
                    custom = {
                        mocha = {
                            fill = {
                                bg = mocha.mantle,
                            },
                            tab = {
                                fg = mocha.mantle,
                                bg = mocha.lavender,
                            },
                            tab_selected = {
                                fg = mocha.mantle,
                                bg = mocha.mauve,
                            },
                            tab_separator = {
                                fg = mocha.mantle,
                                bg = mocha.mantle,
                            },
                            tab_separator_selected = {
                                fg = mocha.mantle,
                                bg = mocha.mantle,
                            },
                            tab_close = {
                                fg = mocha.mantle,
                                bg = mocha.red,
                            },
                            close_button_selected = {
                                fg = mocha.red,
                                bg = mocha.base,
                            },
                            buffer_selected = {
                                bg = mocha.base,
                            },
                            numbers = {
                                fg = mocha.overlay0,
                            },
                            numbers_visible = {
                                fg = mocha.overlay0,
                            },
                            numbers_selected = {
                                fg = mocha.text,
                            },
                            indicator_selected = {
                                fg = mocha.mauve,
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
                            modified_visible = {
                                fg = mocha.lavender,
                                bg = mocha.mantle,
                            },
                            separator = {
                                bg = mocha.mantle,
                            },
                        },
                    },
                },
                options = {
                    mode = "buffers",
                    --numbers = 'buffer_id',
                    modified_icon = '●',
                    left_trunc_marker = '',
                    right_trunc_marker = '',
                    tab_size = 18,
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level, _, _)
                        local symbol = level == "error" and "  "
                        or (level == "warning" and "  "
                        or (level == "hint" and "  "
                        or "  " ))
                        return symbol .. count
                    end,
                    groups = {
                        items = {
                            require('bufferline.groups').builtin.pinned:with({ icon = "" })
                        }
                    },
                    indicator = {
                        style = 'icon',
                        icon = '▎',
                    },
                    buffer_close_icon = '󰅖',
                    close_icon = '',
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "Files",
                            text_align = "center",
                            padding = 0,
                        },
                    },
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = false,
                    separator_style = {'', ''},
                    tab_separator_style = {'', ''},
                    enforce_regular_tabs = false,
                    always_show_bufferline = true,
                },
            }
        end,
    },
}
