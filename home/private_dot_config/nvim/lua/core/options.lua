-- mouse support in normal and visual mode
vim.opt.mouse = "nv"

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- show hidden characters
vim.opt.list = true
vim.opt.listchars = {
    tab = '» ',
    trail = '·',
    --extends = '»',
    precedes = '«',
    nbsp = '×',
    --eol = '↲',
}
vim.opt.showbreak = '↳ '

-- identing
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.wrap = false

-- folding
vim.opt.foldlevel = 99

-- concealing
vim.opt.conceallevel = 3
vim.opt.concealcursor = ''  -- conceal nothing on cursor line

-- show 5 lines above/below and 10 chars left/right of cursor
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 10

-- show colorcolumn relative to textwidth
vim.opt.colorcolumn = '+0'

-- encoding
vim.opt.encoding = "utf-8"
vim.opt.termencoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- highlight cursorline
vim.opt.cursorline = true

-- ignore all lowercase when searching but consider uppercase
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- copy to system clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- gui settings
vim.opt.guifont = 'CaskaydiaCove Nerd Font Mono:h12'
vim.opt.termguicolors = true

-- open split windows to right
vim.opt.splitright = true

-- line numbers
vim.opt.number = true

-- undo
local undodir = os.getenv("HOME") .. "/.vim/undo"
if vim.fn.isdirectory(undodir) ~= 1 then
    vim.fn.mkdir(undodir, "p")
end
vim.opt.undodir = undodir
vim.opt.undofile = true

-- gutter
vim.wo.signcolumn = "yes"

-- diagnostic signs
vim.fn.sign_define("DiagnosticSignError", {text = "", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})

-- diagnostics float
--vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
