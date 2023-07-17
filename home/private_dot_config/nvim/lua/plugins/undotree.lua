return {
    "mbbill/undotree",
    init = function()
        vim.opt.undofile = true
        --vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undo"
    end
}
