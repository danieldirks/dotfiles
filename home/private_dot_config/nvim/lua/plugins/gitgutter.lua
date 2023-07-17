return {
    "airblade/vim-gitgutter",
    init = function()
        vim.g.gitgutter_highlight_lines = 0
        vim.g.gitgutter_override_sign_column_highlight = 0
    end
}