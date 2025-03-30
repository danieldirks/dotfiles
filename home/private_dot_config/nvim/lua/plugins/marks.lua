return {
    {
        -- visualization of marks
        -- https://github.com/chentoast/marks.nvim
        "chentoast/marks.nvim",
        init = function()
            vim.api.nvim_create_autocmd({ "BufRead" }, { command = ":delm a-zA-Z0-9", })  -- remove all marks on read

            local mocha = require("catppuccin.palettes").get_palette "mocha"
            vim.api.nvim_command('highlight MarkSignHL term=NONE cterm=NONE ctermbg=NONE ctermfg=red gui=NONE guibg=NONE guifg='..mocha.peach)
        end,
        opts = {}
    },
}
