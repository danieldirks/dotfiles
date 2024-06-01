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

            -- highlights
            local mocha = require("catppuccin.palettes").get_palette "mocha"
            vim.api.nvim_command('highlight NeoTreeModified term=NONE cterm=NONE ctermbg=NONE ctermfg=white gui=NONE guibg=NONE guifg='..mocha.lavender)
        end,
        opts = {
            default_component_configs = {
                modified = {
                    symbol = "●",
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
                hijack_netrw_behavior = "disabled",  -- open_default
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
                    numbers = 'buffer_id',
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
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "Files",
                            text_align = "center",
                            padding = 0,
                        },
                    },
                    color_icons = true,
                    show_buffer_icons = true,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    separator_style = {'', ''},
                    enforce_regular_tabs = false,
                    always_show_bufferline = true,
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
                dashboard.button("s", "󰑏  Restore Last Session", ":SessionRestore<CR>"),
                dashboard.button("r", "󱑁  Recent Files", ":Telescope oldfiles<CR>"),
                dashboard.button("g", "  Open Git View", ":Neogit<CR>"),
                dashboard.button("w", "󰠮  Open Wiki", ":VimwikiIndex<CR>"),
                dashboard.button("t", "  Open Tasks", ":e ~/Tasks/todo.txt<CR>"),
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
        main = "ibl",
        opts = {
            indent = { char = '┆', },
            scope = { show_start = false },
        },
    },

    {
        -- marks.nvim https://github.com/chentoast/marks.nvim
        "chentoast/marks.nvim",
        init = function()
            vim.api.nvim_create_autocmd({ "BufRead" }, { command = ":delm a-zA-Z0-9", })  -- remove all marks on read

            local mocha = require("catppuccin.palettes").get_palette "mocha"
            vim.api.nvim_command('highlight MarkSignHL term=NONE cterm=NONE ctermbg=NONE ctermfg=red gui=NONE guibg=NONE guifg='..mocha.peach)
        end,
        opts = {}
    },

    {
        -- fidget.nvim https://github.com/j-hui/fidget.nvim
        "j-hui/fidget.nvim",
        opts = {},
    },

    {
        -- oil.nvim https://github.com/stevearc/oil.nvim
        "stevearc/oil.nvim",
        init = function ()
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end,
        opts = {
            default_file_explorer = true,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            keymaps = {
                ["<bs>"] = "actions.parent",
            },
            view_options = {
                show_hidden = true,
            },
        },
    }
}
