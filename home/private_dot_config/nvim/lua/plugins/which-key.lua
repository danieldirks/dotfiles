-- https://github.com/folke/which-key.nvim

local config = {
    "folke/which-key.nvim",
    --event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {},
}

return config
