return {
    {
        -- syntax tree highlighting
        -- https://github.com/nvim-treesitter/nvim-treesitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                use_languagetree = false,
                disable = function(_, bufnr)
                    local file_size = vim.fn.getfsize(vim.fn.bufname(bufnr))
                    return file_size > 5000
                end,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },
}
