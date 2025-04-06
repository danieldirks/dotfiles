return {
    {
        -- screenshot tool for code selection
        -- https://github.com/mistricky/codesnap.nvim
        "mistricky/codesnap.nvim",
        build = "make",
        lazy = true,
        cmd = {
            "CodeSnap",
            "CodeSnapSave",
            "CodeSnapHighlight",
            "CodeSnapHighlightSave",
            "CodeSnapAscii",
        },
        keys = {
            { "<leader>y", "", desc = "yank" },
            { "<leader>ys", ":CodeSnap<cr>", desc = "codesnap to clipboard" },
            { "<leader>yS", ":CodeSnapSave<cr>", desc = "codesnap to ~/pictures/screenshots/" },
            { "<leader>ya", ":CodeSnapAscii<cr>", desc = "codesnap to ascii" },
        },
        opts = {
            --bg_theme = "default",
            bg_color = "#ffffff00",
            code_font_family = "CaskaydiaCove Nerd Font",
            has_breadcrumbs = false,
            has_line_number = true,
            mac_window_bar = false,
            save_path = "~/pictures/screenshots/",
            watermark = "",
        },
    },
}
