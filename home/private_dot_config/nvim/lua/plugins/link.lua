return {
    {
        -- move and manage links in markdown at end of file
        -- https://github.com/qadzek/link.vim
        "qadzek/link.vim",
        cmd = {
            "LinkConvertSingle",
            "LinkConvertAll",
            "LinkConvertRange",
            "LinkReformat",
            "LinkOpen",
            "LinkJump",
            "LinkPeek",
        },
        keys = {
            { "<leader>ll",    ":LinkConvertSingle<cr>", desc = "extract link" },
            { "<leader>la",    ":LinkConvertAll<cr>", desc = "extract all links" },
            { "<leader>lv",    ":LinkConvertRange<cr>", mode = { "v" }, desc = "extract links in visual range" },
            { "<leader>lr",    ":LinkReformat<cr>", desc = "reformat and clean links" },
            { "<leader>l<cr>", ":LinkOpen<cr>", desc = "open link" },
            { "<leader>lj",    ":LinkJump<cr>", desc = "jump to link" },
            { "<leader>lp",    ":LinkPeek<cr>", desc = "peek link" },
        },
    }
}
