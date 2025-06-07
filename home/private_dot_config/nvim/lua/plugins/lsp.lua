return {
    {
        -- installs and enables lsps automatically through vim.lsp.enable
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
                --"jdtls",       -- java
                "jsonls",      -- json
                "texlab",      -- latex
                "lua_ls",      -- lua
                "marksman",    -- markdown
                "pyright",     -- python
                "vuels",       -- vue
                "yamlls",      -- yaml
            },

            automatic_install = true,

            -- config from ../../lsp and https://github.com/neovim/nvim-lspconfig
            automatic_enable = true,
        },
    },

    --{
    --    -- java development tools - will be configured with mason-lspconfig
    --    -- https://github.com/nvim-java/nvim-java
    --    "nvim-java/nvim-java",
    --    config = function ()
    --        require("java").setup({})
    --        vim.lsp.enable({"jdtls"})
    --    end,
    --},
}
