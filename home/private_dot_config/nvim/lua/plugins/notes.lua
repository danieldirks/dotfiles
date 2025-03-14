return {
    {
        -- vimwiki https://github.com/vimwiki/vimwiki
        "vimwiki/vimwiki",
        init = function()
            vim.g.vimwiki_diary_rel_path = 'journals'
            vim.g.vimwiki_ext2syntax = {
                ['.md'] = 'markdown',
                ['.markdown'] = 'markdown',
                ['.mdown'] = 'markdown',
            }
            vim.g.vimwiki_folding = "list"
            vim.g.vimwiki_global_ext = 0
            vim.g.vimwiki_hl_headers = 1
            vim.g.vimwiki_list = {
                {
                    path = '~/notes',
                    syntax = 'markdown',
                    ext = '.md',
                },
            }
            vim.g.vimwiki_markdown_link_ext = 1
            vim.g.vimwiki_folding = 'syntax'

            vim.api.nvim_create_autocmd('BufNewFile', {
                pattern = "*/journals/*.md",
                -- use template.md replacing %filename% with the filename excluding path and extension
                command = [[ silent 0r !cat ~/notes/journals/template.md | sed s/\%filename\%/$(echo '%' | grep -o '[^/]*$' | cut -d. -f1)/g ]],
            })
        end,
    },

    {
        -- todo.txt-vim https://github.com/dbeniamine/todo.txt-vim
        "dbeniamine/todo.txt-vim",
        init = function()
            vim.keymap.set("n", "<leader>t", ":e ~/tasks/todo.txt<cr>", { desc = "Open todo.txt" })
        end,

    },
}
