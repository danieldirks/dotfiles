return {
    {
        -- automatically stores and restores open buffers
        -- https://github.com/rmagatti/auto-session
        "rmagatti/auto-session",
        init = function()
            vim.keymap.set("n", "<leader>ss", ":SessionSave<cr>", { desc = "Save session" })
            vim.keymap.set("n", "<leader>sr", ":SessionRestore<cr>", { desc = "Restore last session" })
        end,
        opts = {
            auto_save_enabled = true,
            auto_restore_enabled = false,
        },
    },
}
