return {
    {
        -- installation and upgrade of language servers and more
        -- https://github.com/williamboman/mason.nvim
        "williamboman/mason.nvim",
        opts = {
            registries = {
                "github:nvim-java/mason-registry",
                "github:mason-org/mason-registry",
            },
            ui = {
                icons = {
                    package_installed = '󰄳',
                    package_pending = '󰳜',
                    package_uninstalled = '󰄰',
                },
            },
        },
    },

    --{
    --    -- automatically installs tools via mason
    --    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
    --    "WhoIsSethDaniel/mason-tool-installer.nvim",
    --    dependencies = {
    --        "williamboman/mason.nvim",
    --    },
    --    opts = {
    --        -- see `:Mason` for available names
    --        ensure_installed = {
    --            -- language servers
    --            "python-lsp-server",
    --        },

    --        -- auto update on startup
    --        auto_update = true,
    --        run_on_start = true,
    --    },
    --},
}
