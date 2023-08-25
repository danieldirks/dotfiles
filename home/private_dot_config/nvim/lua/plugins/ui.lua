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
            term_colors = true,
            integrations = {
                alpha = true,
                gitsigns = true,
                mason = true,
                neotree = true,
                cmp = true,
                native_lsp = {
                    enabled = true,
                },
                treesitter = true,
                telescope = {
                    enabled = true,
                    style = "nvchad"
                },
                vimwiki = true,
                which_key = true,
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
            default_component_configs = {
                modified = {
                    symbol = "",
                    highlight = "NeoTreeModified",
                },
                name = {
                    trailing_slash = false,
                    use_git_status_colors = false,
                    highlight = "NeoTreeFileName",
                },
                git_status = {
                    symbols = {
                        added     = "",
                        modified  = "",
                        deleted   = "",
                        renamed   = "",
                        untracked = "",
                        ignored   = "",
                        unstaged  = "",  -- 
                        staged    = "",
                        conflict  = "!",
                    }
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = true,
                    hide_gitignored = true,
                },
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
                    always_show_bufferline = true,
                    color_icons = true,
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level, _, _)
                        local symbol = level == "error" and "  "
                        or (level == "warning" and "  "
                        or (level == "hint" and "  "
                        or "  " ))
                        return symbol .. count
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
                    numbers = function(opts)
                        return string.format('%s.', opts.id)
                    end,
                },
            }
        end,
    },

    {
        -- alpha-nvim https://github.com/goolord/alpha-nvim
        -- dashboard
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            { "MaximilianLloyd/ascii.nvim", dependencies = "MunifTanjim/nui.nvim" },
        },
        event = "VimEnter",
        config = function()
            local dashboard = require "alpha.themes.dashboard"

            -- art
            dashboard.section.header.val = require("ascii").get_random("text", "neovim")

            -- buttons
            dashboard.section.buttons.val = {
                dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
                dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
                dashboard.button("r", "󱑁  Recent Files", ":Telescope oldfiles<CR>"),
                dashboard.button("w", "󰠮  Open Notes", ":WikiIndex<CR>"),
                dashboard.button("u", "  Update Plugins", ":Lazy update<CR>"),
                dashboard.button("q", "󰗼  Quit", ":qa!<CR>"),
            }

            -- footer
            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
                    local stats = require("lazy").stats()
                    local count = stats.count
                    local time = (math.floor(stats.startuptime + 0.5))
                    dashboard.section.footer.val = "Neovim " .. version .. " loaded with " .. count .. " plugins in " .. time .. "ms"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })

            dashboard.section.footer.opts.hl = "AlphaFooter"
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButton"

            dashboard.opts.opts.noautocmd = false
            require("alpha").setup(dashboard.config)
        end
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

    {
        -- indent-blankline.nvim https://github.com/lukas-reineke/indent-blankline.nvim
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            show_current_context = true,
            --show_current_context_start = true,
        },
    },
}
