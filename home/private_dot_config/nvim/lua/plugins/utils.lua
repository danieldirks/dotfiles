return {
    {
        -- plenary.nvim https://github.com/nvim-lua/plenary.nvim
        -- basic lua functions
        "nvim-lua/plenary.nvim"
    },

    {
        -- auto-session https://github.com/rmagatti/auto-session
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

    {
        -- better-escape.nvim https://github.com/max397574/better-escape.nvim
        -- escaping with key combinations in insert mode
        "max397574/better-escape.nvim",
        opts = {
            mapping = {"jk"},
        },
    },

    {
        -- undotree https://github.com/jiaoshijie/undotree
        "jiaoshijie/undotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        init = function()
            vim.keymap.set("n", "<leader>u", require("undotree").toggle, { noremap = true, silent = true, desc = "Open undotree" })
        end,
        opts = {
            float_diff = false,
            layout = "left_left_bottom",
        },
    },

    {
        -- chezmoi.vim https://github.com/alker0/chezmoi.vim
        -- chezmoi integration
        "alker0/chezmoi.vim",
        lazy = false,
    },


    {
        -- editorconfig-vim https://github.com/editorconfig/editorconfig-vim
        "editorconfig/editorconfig-vim",
        lazy = false,
    },

    {
        -- leetcode.nvim https://github.com/ianding1/leetcode.vim
        -- integration to browse and solve leetcode challenges in vim
        "ianding1/leetcode.vim",
        init = function()
            vim.keymap.set("n", "<leader>ll", ":LeetCodeList<CR>", { noremap = true, desc = "Browse LeetCode challenges" })
            vim.keymap.set("n", "<leader>lt", ":LeetCodeTest<CR>", { noremap = true, desc = "Test LeetCode solution" })
            vim.keymap.set("n", "<leader>ls", ":LeetCodeSubmit<CR>", { noremap = true, desc = "Submit LeetCode solution" })
            vim.keymap.set("n", "<leader>li", ":LeetCodeSignIn<CR>", { noremap = true, desc = "Manually sign in to LeetCode" })

            vim.g.leetcode_solution_filetype = "java"
            vim.g.leetcode_browser = "chrome"
        end
    },

    {
        -- vim-gnupg https://github.com/jamessan/vim-gnupg
        "jamessan/vim-gnupg",
    },

    {
        -- vim-tmux-navigator https://github.com/christoomey/vim-tmux-navigator
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
}
