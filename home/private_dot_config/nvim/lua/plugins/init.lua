-- lazy.nvim plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    --{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "airblade/vim-gitgutter",
    "editorconfig/editorconfig-vim",
    "mbbill/undotree",
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope.nvim", tag = '0.1.2' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    "nvim-tree/nvim-web-devicons",
    "tpope/vim-dispatch",
    "tpope/vim-fugitive",
})

require('plugins/gitgutter')
require('plugins/undotree')
require('plugins/telescope')