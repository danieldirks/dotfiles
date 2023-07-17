vim.opt.mouse = "nv"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", extends = "»", precedes = "«", nbsp = "×" }
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.encoding = "utf-8"
vim.opt.termencoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.cursorline = true
vim.opt.showmode = false  -- hide mode in bottom status bar
vim.opt.ignorecase = true  -- ignore case when searching lowercase
vim.opt.smartcase = true  -- but consider uppercase
vim.opt.guifont='CaskaydiaCove Nerd Font Mono:h12'
vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true
vim.api.nvim_create_augroup("numbertoggle", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
    callback = function()
        vim.opt.relativenumber = true
    end,
    group = "numbertoggle",
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
    callback = function()
        vim.opt.relativenumber = false
    end,
    group = "numbertoggle",
})