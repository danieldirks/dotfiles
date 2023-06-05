""""""""""""""
" appearance "
""""""""""""""

syntax on
filetype plugin indent on
set mouse=a  " mouse support

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set list
set listchars=tab:»\ ,trail:·,extends:»,precedes:«,nbsp:×
set autoindent
set smartindent
set cindent
set nowrap

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" line numbers
set number relativenumber  " relative to cursor position
" switch to absolute numbers in insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set cursorline  " highlight current line
set noshowmode  " hide mode in bottom status bar


"""""""""""""""""""""
" filetype specific "
"""""""""""""""""""""

autocmd FileType make set tabstop=8 softtabstop=0 shiftwidth=8 noexpandtab


""""""""""
" colors "
""""""""""

highlight LineNr       term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLine   term=NONE cterm=NONE ctermfg=NONE     ctermbg=234  gui=NONE guifg=NONE     guibg=#111111
highlight SignColumn   term=NONE cterm=NONE ctermfg=NONE     ctermbg=234  gui=NONE guifg=NONE     guibg=#111111

highlight DiffAdd      term=bold cterm=bold ctermfg=2        ctermbg=234  gui=bold guifg=2        guibg=#111111
highlight DiffDelete   term=bold cterm=bold ctermfg=1        ctermbg=234  gui=bold guifg=1        guibg=#111111
highlight DiffChange   term=bold cterm=bold ctermfg=3        ctermbg=234  gui=bold guifg=3        guibg=#111111


"""""""""""""
" shortcuts "
"""""""""""""

" plugins
map <F2> :UndotreeToggle<CR>


"""""""""""
" plugins "
"""""""""""

" load vim-plug on first startup
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
Plug 'preservim/nerdcommenter'  " comment shortcuts
Plug 'chrisbra/csv.vim'  " csv support
Plug 'editorconfig/editorconfig-vim'  " http://editorconfig.org/
Plug 'tpope/vim-fugitive'  " git integration
Plug 'airblade/vim-gitgutter'  " git visualizations
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'  " statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
Plug 'edkolev/tmuxline.vim'  " uses same airline theme in tmux
Plug 'nathanaelkane/vim-indent-guides'  " indent highlighting
call plug#end()


" gitgutter
let g:gitgutter_highlight_lines = 1  " highlight whole line
let g:gitgutter_override_sign_column_highlight = 0  " don't change signcolumn color

" undotree
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" airline
"let g:airline_theme='powerlineish' " theme
let g:airline_powerline_fonts = 1 " use powerline fonts if installed
let g:airline#extensions#tabline#enabled = 1 " show line on top
let g:airline#extensions#tabline#formatter = 'unique_tail' " show only filename in tabline
" custom line number section
function! MyLineNumber()
  return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). '/'.substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction
call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})
let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])
let g:airline_skip_empty_sections = 1 " hide empty sections visible with powerline font
" symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = 'ro'

" indent guides
let g:indent_guides_enable_on_vim_startup = 1

" theming
colorscheme nord
