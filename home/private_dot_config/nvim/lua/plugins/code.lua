return {
    {
        -- syntax tree highlighting
        -- https://github.com/nvim-treesitter/nvim-treesitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                use_languagetree = false,
                disable = function(_, bufnr)
                    local file_size = vim.fn.getfsize(vim.fn.bufname(bufnr))
                    return file_size > 5000
                end,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },

    {
        -- nvim-autopairs https://github.com/windwp/nvim-autopairs
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    {
        -- outline of symbols based on language servers
        -- https://github.com/simrat39/symbols-outline.nvim
        "hedyhli/outline.nvim",
        cmd = { "Outline", "OutlineOpen" },
        keys = {
            { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        -- defaults: https://github.com/hedyhli/outline.nvim/blob/main/lua/outline/config.lua
        opts = {
            keymaps = {
                show_help = '?',
                close = { '<Esc>', 'q' },
                goto_location = '<Cr>',
                peek_location = 'o',
                goto_and_close = '<S-Cr>',
                restore_location = '<C-g>',
                hover_symbol = '<C-space>',
                toggle_preview = 'K',
                rename_symbol = 'r',
                code_actions = 'a',
                fold = 'h',
                fold_toggle = '<tab>',
                fold_toggle_all = '<S-tab>',
                unfold = 'l',
                fold_all = 'W',
                unfold_all = 'E',
                fold_reset = 'R',
                down_and_jump = '<C-j>',
                up_and_jump = '<C-k>',
            },
            outline_items = {
                auto_set_cursor = false,
            },
            outline_window = {
                auto_close = true,
                show_numbers = true,
            },
            symbol_folding = {
                autofold_dept = 1,
            },
            symbols = {
                icons = {
                    File = { icon = '󰈔', hl = 'Identifier' },
                    Module = { icon = '󰆧', hl = 'Include' },
                    Namespace = { icon = '󰅪', hl = 'Include' },
                    Package = { icon = '󰏗', hl = 'Include' },
                    Class = { icon = '𝓒', hl = 'Type' },
                    Method = { icon = 'ƒ', hl = 'Function' },
                    Property = { icon = '', hl = 'Identifier' },
                    Field = { icon = '󰆨', hl = 'Identifier' },
                    Constructor = { icon = '', hl = 'Special' },
                    Enum = { icon = 'ℰ', hl = 'Type' },
                    Interface = { icon = '󰜰', hl = 'Type' },
                    Function = { icon = '', hl = 'Function' },
                    Variable = { icon = '', hl = 'Constant' },
                    Constant = { icon = '', hl = 'Constant' },
                    String = { icon = '𝓐', hl = 'String' },
                    Number = { icon = '#', hl = 'Number' },
                    Boolean = { icon = '⊨', hl = 'Boolean' },
                    Array = { icon = '󰅪', hl = 'Constant' },
                    Object = { icon = '⦿', hl = 'Type' },
                    Key = { icon = '󰌆', hl = 'Type' },
                    Null = { icon = 'NULL', hl = 'Type' },
                    EnumMember = { icon = '', hl = 'Identifier' },
                    Struct = { icon = '𝓢', hl = 'Structure' },
                    Event = { icon = '🗲', hl = 'Type' },
                    Operator = { icon = '+', hl = 'Identifier' },
                    TypeParameter = { icon = '𝙏', hl = 'Identifier' },
                    Component = { icon = '󰅴', hl = 'Function' },
                    Fragment = { icon = '󰅴', hl = 'Constant' },
                    TypeAlias = { icon = ' ', hl = 'Type' },
                    Parameter = { icon = ' ', hl = 'Identifier' },
                    StaticMethod = { icon = ' ', hl = 'Function' },
                    Macro = { icon = ' ', hl = 'Function' },
                },
            },
        },
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        init = function()
            vim.keymap.set("n", "<leader>q", ":Trouble<cr>", { desc = "Toggle Trouble list" })
        end,
        opts = {
            use_diagnostic_signs = true,
        },
    },
}
