return {
    -- nvim-lspconfig
    { "neovim/nvim-lspconfig",
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

    -- mason-lspconfig https://github.com/williamboman/mason-lspconfig.nvim
    { "williamboman/mason-lspconfig.nvim",
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
}
