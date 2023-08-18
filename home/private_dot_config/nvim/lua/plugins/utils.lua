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
        -- undotree https://github.com/mbbill/undotree
        "mbbill/undotree",
        lazy = false,
        init = function()
            vim.opt.undofile = true
            vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undo"
        end,
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
}
