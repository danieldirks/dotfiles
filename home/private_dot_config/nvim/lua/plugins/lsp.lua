return {
    {
        -- sets up language servers automatically via lspconfig
        -- https://github.com/williamboman/mason-lspconfig.nvim
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            -- language servers, see https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
            ensure_installed = {
                "bashls",      -- bash
                "clangd",      -- c
                "gradle_ls",   -- gradle
                "html",        -- html
                "htmx",        -- htmx
                "jdtls",       -- java
                "jsonls",      -- json
                "texlab",      -- latex
                "lua_ls",      -- lua
                "marksman",    -- markdown
                "pyright",     -- python
                "vuels",       -- vue
                "yamlls",      -- yaml
            },

            automatic_install = true,

            -- server setup
            -- handlers can override or extend default config from https://github.com/neovim/nvim-lspconfig
            handlers = {
                -- setup all servers automatically
                function (server)
                    require("lspconfig")[server].setup {}
                end,

                -- custom config for jdtls
                ["jdtls"] = function()
                    require("java").setup()
                    require("lspconfig").jdtls.setup {
                        cmd = { "jdtls" },
                    }
                end,

                -- custom config for ltex
                ["ltex"] = function()
                    require("lspconfig").ltex.setup {
                        -- https://valentjn.github.io/ltex/settings.html
                        settings = {
                            ltex = {
                                dictionary = {
                                    ["en-US"] = {},
                                },
                                disabledRules = {
                                    ["en-US"] = { "PROFANITY", "MORFOLOGIK_RULE_EN_US" },
                                },
                            },
                        },
                    }
                end,

                -- custom config for lua_ls
                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup {
                        -- https://luals.github.io/wiki/settings/#settings
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
        -- java development tools - will be configured with mason-lspconfig
        -- https://github.com/nvim-java/nvim-java
        "nvim-java/nvim-java",
        ft = { "java" },
        config = false,
    },
}
