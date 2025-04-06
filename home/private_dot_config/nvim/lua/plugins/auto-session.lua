return {
    {
        -- store and restore open buffers
        -- https://github.com/rmagatti/auto-session
        "rmagatti/auto-session",
        keys = {
            { "<leader>s", "", desc = "session" },
            { "<leader>ss", ":SessionSave<cr>", desc = "save session" },
            { "<leader>sr", ":SessionRestore<cr>", desc = "restore last session" },
        },
        opts = {
            auto_save_enabled = true,  -- automatically save session on exit
            auto_restore_enabled = false,
        },
    },
}
