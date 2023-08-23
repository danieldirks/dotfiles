return {
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
}
