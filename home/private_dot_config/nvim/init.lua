HOME = os.getenv("HOME")

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
vim.opt.encoding = "utf-8"
vim.opt.termencoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.cursorline = true
vim.opt.showmode = false  -- hide mode in bottom status bar
vim.opt.ignorecase = true  -- ignore case when searching lowercase
vim.opt.smartcase = true  -- but consider uppercase
vim.opt.termguicolors = true

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

vim.opt.clipboard = "unnamedplus"

vim.cmd[[syntax on]]
vim.cmd[[filetype plugin indent on]]
vim.cmd[[autocmd FileType make set tabstop=8 softtabstop=0 shiftwidth=8 noexpandtab]]

vim.cmd([[
highlight LineNr       term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLine   term=NONE cterm=NONE ctermfg=NONE     ctermbg=NONE gui=NONE guifg=NONE     guibg=NONE
highlight SignColumn   term=NONE cterm=NONE ctermfg=NONE     ctermbg=NONE gui=NONE guifg=NONE     guibg=NONE

highlight DiffAdd      term=bold cterm=bold ctermfg=2        ctermbg=234  gui=bold guifg=2        guibg=NONE
highlight DiffDelete   term=bold cterm=bold ctermfg=1        ctermbg=234  gui=bold guifg=1        guibg=NONE
highlight DiffChange   term=bold cterm=bold ctermfg=3        ctermbg=234  gui=bold guifg=3        guibg=NONE
]])

-- keys
vim.g.mapleader = " "
vim.keymap.set("n", "<F2>", ":UndoTreeToggle<CR>")

-- lary.nvim plugins
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
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "airblade/vim-gitgutter",
    "editorconfig/editorconfig-vim",
    "itchyny/vim-gitbranch",
    "mbbill/undotree",
    "nvim-lua/plenary.nvim",
    "nvim-lualine/lualine.nvim",
    { "nvim-telescope/telescope.nvim", tag = '0.1.2' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    "nvim-tree/nvim-web-devicons",
    "tpope/vim-dispatch",
    "tpope/vim-fugitive",
})

-- statusline
require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '|'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = false,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {{icon='', 'mode'}},
        lualine_b = {{icon='󰈚', 'filename', file_status = 1, path = 0}},
        lualine_c = {{icon='󰘬', 'branch', 'diff'}},
        lualine_x = {'diagnostics'},
        lualine_y = {{icon='󰉋', '%{fnamemodify(getcwd(), ":t")}'}},
        lualine_z = {{icon='󰦨', 'progress'}}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})

-- gitgutter
vim.g.gitgutter_highlight_lines = 0
vim.g.gitgutter_override_sign_column_highlight = 0

-- undotree
vim.opt.undofile = true
vim.opt.undodir = HOME .. "/.local/share/nvim/undo"

-- catppuccin
require("catppuccin").setup({
    flavour = "macchiato",
    background = {
        light = "latte",
        dark = "macchiato",
    },
    transparent_background = false,
    styles = {
        comments = {},
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    --color_overrides = {},
    --custom_highlights = {},
    --integrations = {},
})
vim.cmd.colorscheme "catppuccin-macchiato"

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
