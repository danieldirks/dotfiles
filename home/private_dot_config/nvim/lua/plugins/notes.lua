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
                    path = '~/Notes',
                    syntax = 'markdown',
                    ext = '.md',
                },
            }
            vim.g.vimwiki_markdown_link_ext = 1
        end,
    },

    {
        -- todo.txt-vim https://github.com/dbeniamine/todo.txt-vim
        "dbeniamine/todo.txt-vim",
    },
}
