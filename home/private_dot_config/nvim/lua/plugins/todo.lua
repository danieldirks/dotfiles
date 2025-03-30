return {
    {
        -- https://github.com/dbeniamine/todo.txt-vim
        "dbeniamine/todo.txt-vim",
        init = function()
            vim.keymap.set("n", "<leader>t", ":e ~/tasks/todo.txt<cr>", { desc = "Open todo.txt" })
        end,
    },
}
