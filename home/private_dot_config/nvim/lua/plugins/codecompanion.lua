return {
    -- ai integration
    -- https://github.com/olimorris/codecompanion.nvim
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        keys = {
            { "<leader>a", "", desc = "ai assistant" },
            { "<leader>aa", ":CodeCompanionChat<cr>", mode = { "n" }, desc = "[ai] toggle chat" },
            { "<leader>aa", ":CodeCompanion<cr>", mode = { "v" }, desc = "[ai] implement selection" },
        },
        opts = {
            strategies = {
                chat = {
                    adapter = {
                        name = "ollama",
                        model = "gpt-oss:20b",
                    },
                    keymaps = {
                        send = {
                            modes = { n = "<C-cr>", i = "<C-cr>" },
                        },
                        close = {
                            modes = { n = "<C-c>", i = "<C-c>" },
                        },
                    },
                },
                inline = {
                    adapter = {
                        name = "ollama",
                        model = "devstral:24b",
                    },
                },
                cmd = {
                    adapter = {
                        name = "ollama",
                        model = "devstral:24b",
                    },
                },
            }
        },
    },
}
