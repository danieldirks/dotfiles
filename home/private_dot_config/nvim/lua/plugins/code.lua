return {
    -- language support
    {
        -- nvim-lspconfig https://github.com/neovim/nvim-lspconfig
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "jay-babu/mason-nvim-dap.nvim",
        },
    },

    {
        "williamboman/mason.nvim",
        opts = {
            registries = {
                "github:nvim-java/mason-registry",
                "github:mason-org/mason-registry",
            },
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        },
    },

    {
        -- mason-lspconfig.nvim https://github.com/williamboman/mason-lspconfig.nvim
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            -- language servers, see https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
            ensure_installed = {
                --"ansiblels", -- ansible
                --"bashls",    -- bash
                "clangd",    -- c
                "cmake",     -- cmake
                --"cssls",     -- css
                --"dockerls",  -- docker
                --"docker_compose_language_service", -- docker compose
                "gradle_ls", -- gradle
                "html",      -- html
                "htmx",      -- htmx
                "jdtls",     -- java
                --"jsonls",    -- json
                --"ltex",      -- latex
                "lua_ls",    -- lua
                "marksman",  -- markdown
                "pylsp",     -- python
                "terraformls", -- terraform
                "vuels",     -- vue
                "yamlls",    -- yaml
            },

            automatic_install = true,

            -- server auto setup
            handlers = {
                function (server)
                    require("lspconfig")[server].setup {}
                end,

                ["jdtls"] = function()
                    require("java").setup()
                    require("lspconfig").jdtls.setup {
                        cmd = { "jdtls" },
                    }
                end,

                -- custom latex config
                ["ltex"] = function()
                    require("lspconfig").ltex.setup {
                        settings = {
                            ltex = {
                                disabledRules = {
                                    ["en-US"] = { "PROFANITY", "MORFOLOGIK_RULE_EN_US" },
                                },
                                dictionary = {
                                    ["en-US"] = {},
                                },
                            },
                        },
                    }
                end,

                -- custom lua config
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                            },
                        },
                    }
                end,
            },
        },
    },

    {
        -- mason-nvim-dap.nvim https://github.com/jay-babu/mason-nvim-dap.nvim
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            ensure_installed = { "javadbg" },
        }
    },

    {
        -- nvim-java https://github.com/nvim-java/nvim-java
        "nvim-java/nvim-java",
        ft = { "java" },
        config = false,
    },

    -- syntax
    {
        -- nvim-treesitter https://github.com/nvim-treesitter/nvim-treesitter
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

    -- utils
    {
        -- nvim-autopairs https://github.com/windwp/nvim-autopairs
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    {
        -- symbols-outline.nvim https://github.com/simrat39/symbols-outline.nvim
        "simrat39/symbols-outline.nvim",
        init = function()
            vim.keymap.set("n", "<leader>o", ":SymbolsOutline<cr>", { desc = "Show outline" })
        end,
        opts = {
            auto_close = true,
            keymaps = {
                close = {"<Esc>", "q"},
                goto_location = "<Cr>",
                focus_location = "o",
                hover_symbol = "<C-space>",
                toggle_preview = "K",
                rename_symbol = "r",
                code_actions = "a",
                fold = "h",
                unfold = "l",
                fold_all = "W",
                unfold_all = "E",
                fold_reset = "R",
            },
            symbols = {
                File = { icon = "F", hl = "@text.uri" },
                Module = { icon = "", hl = "@namespace" },
                Namespace = { icon = "N", hl = "@namespace" },
                Package = { icon = ".", hl = "@namespace" },
                Class = { icon = "C", hl = "@type" },
                Method = { icon = "", hl = "@method" },
                Property = { icon = "", hl = "@method" },
                Field = { icon = "", hl = "@field" },
                Constructor = { icon = "", hl = "@constructor" },
                Enum = { icon = "E", hl = "@type" },
                Interface = { icon = "I", hl = "@type" },
                Function = { icon = "F", hl = "@function" },
                Variable = { icon = "V", hl = "@constant" },
                Constant = { icon = "", hl = "@constant" },
                String = { icon = "S", hl = "@string" },
                Number = { icon = "#", hl = "@number" },
                Boolean = { icon = "b", hl = "@boolean" },
                Array = { icon = "[", hl = "@constant" },
                Object = { icon = "O", hl = "@type" },
                Key = { icon = "K", hl = "@type" },
                Null = { icon = "N", hl = "@type" },
                EnumMember = { icon = "M", hl = "@field" },
                Struct = { icon = "", hl = "@type" },
                Event = { icon = "", hl = "@type" },
                Operator = { icon = "", hl = "@operator" },
                TypeParameter = { icon = "", hl = "@parameter" },
                Component = { icon = "", hl = "@function" },
                Fragment = { icon = "", hl = "@constant" },
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
