-- plugins for file management

return {

    -- oil.nvim https://github.com/stevearc/oil.nvim
    -- file manager and netrw replacement to edit directories as vim buffers
    {
        "stevearc/oil.nvim",
        init = function ()
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end,
        opts = {
            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            constrain_cursor = "editable",  -- editable, name, false
            default_file_explorer = true,
            delete_to_trash = true,
            git = {
                add = function(path)
                    return true
                end,
                mv = function(src_path, dest_path)
                    return true
                end,
                rm = function(path)
                    return true
                end,
            },
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<S-CR>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
                --["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
                ["<C-CR>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["<F5>"] = "actions.refresh",
                ["<bs>"] = "actions.parent",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
            },
            use_default_keymaps = false,  -- remove all default keymaps
            preview = {
                max_width = { 100, 0.8 },
                min_width = { 40, 0.4 },
                width = nil,
                max_height = 0.9,
                min_height = { 5, 0.1 },
                height = nil,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
                update_on_cursor_moved = true,
            },
            skip_confirm_for_simple_edits = true,
            view_options = {
                case_insensitive = false,
                natural_order = true,
                show_hidden = false,
                sort = {
                    { "type", "asc" },  -- folders before files
                    { "name", "asc" },
                },
            },
            watch_for_changes = false,
        },
    },

    -- image.nvim https://github.com/3rd/image.nvim
    -- support for inline images using terminal image protocol
    --{
    --    "3rd/image.nvim",
    --    build = "luarocks install --local --lua-version 5.1 magick",
    --    opts = {
    --        backend = "kitty",
    --        integrations = {
    --            markdown = {
    --                enabled = true,
    --                clear_in_insert_mode = true,
    --                download_remote_images = true,
    --                only_render_image_at_cursor = false,
    --                filetypes = { "markdown", "vimwiki" },
    --            },
    --            html = {
    --                enabled = false,
    --            },
    --            css = {
    --                enabled = false,
    --            },
    --        },
    --        max_width = nil,
    --        max_height = nil,
    --        max_width_window_percentage = nil,
    --        max_height_window_percentage = 50,
    --        window_overlap_clear_enabled = false,
    --        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    --        editor_only_render_when_focused = false,
    --        tmux_show_only_in_active_window = false,
    --        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
    --    },
    --},

    -- vim-gnupg https://github.com/jamessan/vim-gnupg
    -- en/decrypt gnupg files automatically
    {
        "jamessan/vim-gnupg",
    },
}
