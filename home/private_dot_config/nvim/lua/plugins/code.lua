return {
    -- language support
    {
        -- nvim-lspconfig https://github.com/neovim/nvim-lspconfig
        "neovim/nvim-lspconfig",
        dependencies = { "mason-lspconfig.nvim" },
    },

    {
        -- mason-lspconfig.nvim https://github.com/williamboman/mason-lspconfig.nvim
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            { "williamboman/mason.nvim", opts = {}, },
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
                --"html",      -- html
                "jdtls",     -- java
                --"jsonls",    -- json
                --"ltex",      -- latex
                "lua_ls",    -- lua
                "marksman",  -- markdown
                "pylsp",     -- python
                "tflint",    -- terraform
            },

            -- server auto setup
            handlers = {
                function (server)
                    require("lspconfig")[server].setup {}
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
            },
        },
    },

    -- syntax
    {
        -- nvim-treesitter https://github.com/nvim-treesitter/nvim-treesitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            auto_install = true,
            highlight = { enable = true },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end
    },

    -- autocompletion
    {
        -- nvim-cmp https://github.com/hrsh7th/nvim-cmp
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lua",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            vim.opt.completeopt = { "menu", "menuone", "noselect" }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                }),
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })

            -- nvim-autopairs config, see https://github.com/windwp/nvim-autopairs
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    },

    -- snippets
    {
        -- LuaSnip https://github.com/L3MON4D3/LuaSnip
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets"  -- collection of community snippets
        },
        init = function()
            require("luasnip.loaders.from_snipmate").lazy_load()
        end,
    },

    -- utils
    {
        -- nvim-autopairs https://github.com/windwp/nvim-autopairs
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    {
        -- copilot.vim https://github.com/github/copilot.vim
        "github/copilot.vim",
        build = ":Copilot setup",
        config = function()
            vim.cmd(":Copilot disable")
            vim.keymap.set("n", "<leader>ce", ":Copilot enable<cr>", { desc = "Enable Copilot" })
            vim.keymap.set("n", "<leader>cd", ":Copilot disable<cr>", { desc = "Disable Copilot" })
        end,
    },

    {
        -- symbols-outline.nvim https://github.com/simrat39/symbols-outline.nvim
        "simrat39/symbols-outline.nvim",
        init = function()
            vim.keymap.set('n', '<leader>o', ':SymbolsOutline<cr>', { desc = 'Show outline' })
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
    }
}
