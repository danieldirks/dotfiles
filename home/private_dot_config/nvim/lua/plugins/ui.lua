return {
    -- color theme
    {
        -- catppuccin https://github.com/catppuccin/nvim
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
            term_colors = false,
            integrations = {
                gitsigns = true,
                neotree = true,
                treesitter = true,
                telescope = {
                    enabled = true,
                    style = "nvchad"
                },
                which_key = false,
            },
        },
    },

    {
        -- neo-tree.nvim https://github.com/nvim-neo-tree/neo-tree.nvim
        -- file explorer
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        init = function()
            vim.keymap.set('n', '<leader>e', ":Neotree<CR>", { desc = "Open explorer" })
        end,
        opts = {
            filesystem = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
                },
                hijack_netrw_behavior = "open_default",
            },
        },
    },

    {
        -- bufferline.nvim https://github.com/akinsho/bufferline.nvim
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
    },

    {
        -- which-key https://github.com/folke/which-key.nvim
        -- key mappings help popup
        "folke/which-key.nvim",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
}
