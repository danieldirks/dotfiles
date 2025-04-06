return {
    {
        -- file explorer side bar
        -- https://github.com/nvim-neo-tree/neo-tree.nvim
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { '<leader>e', ":Neotree<CR>", desc = "explorer" },
        },
        init = function()
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
}
