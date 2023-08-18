return {
    {
        -- vimwiki https://github.com/vimwiki/vimwiki
        "vimwiki/vimwiki",
        init = function()
            vim.g.vimwiki_diary_rel_path = "journals"
            vim.g.vimwiki_folding = ""
            vim.g.vimwiki_list = {
                {
                    path = "~/Notes/home/",
                    synatx = "default",
                },
            }
        end,
    },

    {
        -- vim-zettel https://github.com/michal-h21/vim-zettel
        "michal-h21/vim-zettel",
        dependencies = { "junegunn/fzf", "junegunn/fzf.vim", },
    },
}
