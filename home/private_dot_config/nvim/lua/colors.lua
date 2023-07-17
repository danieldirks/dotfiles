vim.opt.termguicolors = true

vim.cmd[[syntax on]]
vim.cmd[[filetype plugin indent on]]
vim.cmd[[autocmd FileType make set tabstop=8 softtabstop=0 shiftwidth=8 noexpandtab]]

vim.cmd([[
highlight LineNr       term=bold cterm=NONE ctermfg=yellow ctermbg=NONE   gui=NONE guifg=NONE  guibg=NONE
highlight CursorLine   term=NONE cterm=NONE ctermfg=NONE   ctermbg=black  gui=NONE guifg=NONE  guibg=NONE
highlight SignColumn   term=NONE cterm=NONE ctermfg=NONE   ctermbg=NONE   gui=NONE guifg=NONE  guibg=NONE

highlight DiffAdd      term=bold cterm=bold ctermfg=green  ctermbg=234    gui=bold guifg=NONE  guibg=NONE
highlight DiffDelete   term=bold cterm=bold ctermfg=red    ctermbg=234    gui=bold guifg=NONE  guibg=NONE
highlight DiffChange   term=bold cterm=bold ctermfg=yellow ctermbg=234    gui=bold guifg=NONE  guibg=NONE
]])
