return {
    {
        -- sets up dap adapters automatically via nvim-dap
        -- https://github.com/jay-babu/mason-nvim-dap.nvim
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            -- adapters, see https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
            ensure_installed = {
                "javadbg"
            },

            -- dap adapter setup
            handlers = {
                -- setup all debuggers automatically
                function(config)
                    require('mason-nvim-dap').default_setup(config)
                end,
            },
        }
    },

    {
        -- ui for nvim-dap
        -- https://github.com/rcarriga/nvim-dap-ui
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        keys = {
            { "<leader>d", ":lua require('dapui').toggle()<cr>", desc = "Toggle DAP UI" },
        },
        config = function (opts)
            require("dapui").setup(opts)
        end,
    },
}
