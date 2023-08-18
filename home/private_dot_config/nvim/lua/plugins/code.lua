return {
    -- language support
    {
        -- nvim-lspconfig https://github.com/neovim/nvim-lspconfig
        "neovim/nvim-lspconfig",
        dependencies = { "mason-lspconfig.nvim" },
        init = function()
            -- set gutter icons
            local signs = { Error = "", Warn = "", Hint = "", Info = "󰋼" }
            for type, icon in pairs(signs) do
              local hl = "DiagnosticSign" .. type
              vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end
        end,
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
                "ltex",      -- latex
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
}
