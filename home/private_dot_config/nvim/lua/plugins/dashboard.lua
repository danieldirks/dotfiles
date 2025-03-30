return {
    {
        -- dashboard
        -- https://github.com/goolord/alpha-nvim
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            { "MaximilianLloyd/ascii.nvim", dependencies = "MunifTanjim/nui.nvim" },
        },
        event = "VimEnter",
        config = function()
            local dashboard = require "alpha.themes.dashboard"

            -- art
            dashboard.section.header.val = require("ascii").get_random("text", "neovim")

            -- buttons
            dashboard.section.buttons.val = {
                dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
                dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
                dashboard.button("s", "󰑏  Restore Last Session", ":SessionRestore<CR>"),
                dashboard.button("r", "󱑁  Recent Files", ":Telescope oldfiles<CR>"),
                dashboard.button("g", "  Open Git View", ":Neogit<CR>"),
                dashboard.button("w", "󰠮  Open Wiki", ":VimwikiIndex<CR>"),
                dashboard.button("t", "  Open Tasks", ":e ~/tasks/todo.txt<CR>"),
                dashboard.button("u", "  Update Plugins", ":Lazy update<CR>"),
                dashboard.button("q", "󰗼  Quit", ":qa!<CR>"),
            }

            -- footer
            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
                    local stats = require("lazy").stats()
                    local count = stats.count
                    local time = (math.floor(stats.startuptime + 0.5))
                    dashboard.section.footer.val = "Neovim " .. version .. " loaded with " .. count .. " plugins in " .. time .. "ms"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })

            dashboard.section.footer.opts.hl = "AlphaFooter"
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButton"

            dashboard.opts.opts.noautocmd = false
            require("alpha").setup(dashboard.config)
        end
    },
}
