return {
    {
        -- escape with key combinations in insert mode
        -- https://github.com/max397574/better-escape.nvim
        "max397574/better-escape.nvim",
        opts = {
            mappings = {
                i = {
                    j = {
                        k = "<Esc>",
                        j = false,
                    }
                },
                v = {
                    j = {
                        k = false,
                    },
                },
            },
        },
    },
}
