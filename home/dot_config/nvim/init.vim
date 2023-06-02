""""""""""""""
" Appearance "
""""""""""""""

syntax on
filetype plugin indent on
set mouse=a " mouse support

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
set number relativenumber " relative to cursor position
" switch to absolute numbers in insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set cursorline " highlight current line
set noshowmode " hide mode in bottom status bar


"""""""""""""""""""""
" Filetype specific "
"""""""""""""""""""""

autocmd FileType make set tabstop=8 softtabstop=0 shiftwidth=8 noexpandtab


""""""""""
" Colors "
""""""""""

highlight LineNr       term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLine   term=NONE cterm=NONE ctermfg=NONE     ctermbg=234  gui=NONE guifg=NONE     guibg=#111111
highlight SignColumn   term=NONE cterm=NONE ctermfg=NONE     ctermbg=234  gui=NONE guifg=NONE     guibg=#111111

highlight DiffAdd      term=bold cterm=bold ctermfg=2        ctermbg=234  gui=bold guifg=2        guibg=#111111
highlight DiffDelete   term=bold cterm=bold ctermfg=1        ctermbg=234  gui=bold guifg=1        guibg=#111111
highlight DiffChange   term=bold cterm=bold ctermfg=3        ctermbg=234  gui=bold guifg=3        guibg=#111111

" plugins
highlight SyntasticWarningSign term=NONE cterm=NONE ctermfg=Yellow ctermbg=234  gui=NONE guifg=Yellow guibg=#111111
highlight SyntasticErrorSign   term=NONE cterm=NONE ctermfg=Red    ctermbg=234  gui=NONE guifg=Red    guibg=#111111
highlight IndentGuidesOdd      term=NONE cterm=NONE ctermfg=NONE   ctermbg=NONE gui=NONE guifg=NONE   guibg=NONE
highlight IndentGuidesEven     term=NONE cterm=NONE ctermfg=NONE   ctermbg=234  gui=NONE guifg=NONE   guibg=#111111

" NERDTree file highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight '.a:extension.' ctermbg='.a:bg.' ctermfg='.a:fg.' guibg='.a:guibg.' guifg='.a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('md', 'darkyellow', 'none', 'darkyellow', 'none')
call NERDTreeHighlightFile('ini', 'darkyellow', 'none', 'darkyellow', 'none')
call NERDTreeHighlightFile('php', 'cyan', 'none', 'cyan', 'none')
call NERDTreeHighlightFile('phar', 'cyan', 'none', 'cyan', 'none')
call NERDTreeHighlightFile('py', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('ipynb', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('js', 'green', 'none', 'green', 'none')
call NERDTreeHighlightFile('json', 'green', 'none', 'green', 'none')
call NERDTreeHighlightFile('ts', 'cyan', 'none', 'cyan', 'none')
call NERDTreeHighlightFile('css', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('html', 'red', 'none', 'red', 'none')
call NERDTreeHighlightFile('xml', 'red', 'none', 'red', 'none')
call NERDTreeHighlightFile('lock', 'grey', 'none', 'grey', 'none')
call NERDTreeHighlightFile('png', 'magenta', 'none', 'magenta', 'none')
call NERDTreeHighlightFile('jpg', 'magenta', 'none', 'magenta', 'none')
call NERDTreeHighlightFile('jpeg', 'magenta', 'none', 'magenta', 'none')
call NERDTreeHighlightFile('ico', 'magenta', 'none', 'magenta', 'none')
call NERDTreeHighlightFile('svg', 'magenta', 'none', 'magenta', 'none')
call NERDTreeHighlightFile('pdf', 'red', 'none', 'red', 'none')


"""""""""""""
" Shortcuts "
"""""""""""""

" switch pane
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" switch buffer
map <C-a> :bnext<CR>

" plugins
map <F2> :NERDTreeToggle<CR>
map <F4> :UndotreeToggle<CR>


"""""""""""
" Plugins "
"""""""""""

" load vim-plug on first startup
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
Plug 'scrooloose/nerdcommenter' " comment shortcuts
Plug 'scrooloose/nerdtree' " file system explorer
Plug 'chrisbra/csv.vim' " CSV support
Plug 'chrisbra/Colorizer', { 'autoload': { 'commands': ['Colorizer'], } } " highlight colors
Plug 'editorconfig/editorconfig-vim' " http://editorconfig.org/
Plug 'tpope/vim-fugitive' " Git integration
Plug 'airblade/vim-gitgutter' " Git visualizations
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline' " statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim' " uses same airline theme in tmux
Plug 'nathanaelkane/vim-indent-guides' " indent highlighting
call plug#end()


"""""""""""""""""
" Plugin Config "
"""""""""""""""""

" NERDCommenter
let g:NERDSpaceDelims = 1 " Space between content and comment symbol

" gitgutter
"let g:gitgutter_highlight_lines = 1 " highlight whole line
let g:gitgutter_override_sign_column_highlight = 0 " don't change signcolumn color

" Colorizer
let g:colorizer_auto_color = 1

" Undotree
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" Airline
let g:airline_theme='powerlineish' " theme
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
let g:airline_symbols.branch = '⑂'
let g:airline_symbols.readonly = 'ro'

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0 " enable own color schemes
