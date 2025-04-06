return {
    {
        -- tree visualization of undo history
        -- https://github.com/jiaoshijie/undotree
        "jiaoshijie/undotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>u", ":lua require('undotree').toggle()<cr>", desc = "undotree", noremap = true, silent = true }
        },
        opts = {
            float_diff = false,
            layout = "left_left_bottom",
        },
    },
}
