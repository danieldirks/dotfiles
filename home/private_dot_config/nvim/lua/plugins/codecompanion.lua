return {
    -- ai integration
    -- https://github.com/olimorris/codecompanion.nvim
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            strategies = {
                chat = {
                    adapter = {
                        name = "ollama",
                        model = "qwen2.5-coder:7b",
                    },
                },
                inline = {
                    adapter = {
                        name = "ollama",
                        model = "qwen2.5-coder:7b",
                    },
                },
                cmd = {
                    adapter = {
                        name = "ollama",
                        model = "qwen2.5-coder:7b",
                    },
                },
            }
        },
    },
}
