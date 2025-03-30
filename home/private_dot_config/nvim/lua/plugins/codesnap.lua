return {
    {
        -- screenshot tool for code selection
        -- https://github.com/mistricky/codesnap.nvim
        "mistricky/codesnap.nvim",
        build = "make",
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
        cmd = {
            "CodeSnap",
            "CodeSnapSave",
            "CodeSnapHighlight",
            "CodeSnapHighlightSave",
        },
    },
}
