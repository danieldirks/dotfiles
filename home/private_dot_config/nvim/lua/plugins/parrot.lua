return {
    {
        -- llm assistant
        -- https://github.com/frankroeder/parrot.nvim
        "frankroeder/parrot.nvim",
        dependencies = {
            "ibhagwan/fzf-lua",
            "nvim-lua/plenary.nvim"
        },
        keys = {
            { "<leader>a", "", desc = "assistant" },
            -- chat
            { "<leader>aa",    ":PrtChatToggle<cr>", desc = "[chat] toggle chat" },
            { "<leader>an",    ":PrtChatNew<cr>", desc = "[chat] new chat" },
            { "<leader>a<cr>", ":PrtChatResponde<cr>", desc = "[chat] submit" },
            { "<leader>af",    ":PrtChatFinder<cr>", desc = "[chat] find chat" },
            { "<leader>ad",    ":PrtChatDelete<cr>", desc = "[chat] delete chat" },
            { "<leader>ay",    ":PrtChatPaste<cr>", desc = "[chat] copy into chat" },
            -- code
            { "<leader>ai",    ":PrtImplement<cr>", mode = { "n", "v" }, desc = "implement selection" },
            { "<leader>ar",    ":PrtRewrite<cr>", mode = { "n", "v" }, desc = "rewrite selection" },
            { "<leader>ao",    ":PrtAppend<cr>", mode = { "n", "v" }, desc = "append to selection" },
            { "<leader>aO",    ":PrtPrepend<cr>", mode = { "n", "v" }, desc = "prepend to selection" },
            { "<leader>ae",    ":PrtEdit<cr>", desc = "edit last prompt" },
            { "<leader>au",    ":PrtRetry<cr>", desc = "retry last prompt" },
            -- config
            { "<leader>am",    ":PrtModel<cr>", desc = "[config] select model" },
        },
        opts = {
            providers = {
                ollama = {
                    topic = {
                        model = "mistral:latest",
                    },
                },
            },
        },
    },
}
