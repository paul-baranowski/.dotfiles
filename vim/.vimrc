set noswapfile
set nocompatible
syntax on
filetype on
set lines=35 columns=150
set colorcolumn=100
set number
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
colorscheme material-monokai
set background=dark
set termguicolors
set hidden
set history=100
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set splitbelow
set splitright
set hlsearch
" " let mapleader=","
autocmd BufWritePre * :%s/\s\+$//e " remove whitespaces on save.
map <leader>h :noh<cr>

" Use Arrows
" map <D-A-RIGHT> <C-w>l
" map <D-A-LEFT> <C-w>h
" map <D-A-DOWN> <C-w><C-w>
" map <D-A-UP> <C-w>W

" Remap splits
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

nnoremap <Leader><Leader> :e#<CR> " move back and forth between two files by pressing the Leader key twice.
noremap <Leader>r :CommandTFlush<CR> " Here a way to reindex everything by simply pressing <Leader>+r:
set showmatch " When selecting a parenthesis it will highlight the one matching:

set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " Let Vundle manage Vundle, required

"
" Nerd Tree Plugins
"
Plugin 'scrooloose/nerdtree'
" Always open the tree when booting Vim, but don’t focus it:
autocmd VimEnter * NERDTree
" Remap the left arrow to move up a directory.
autocmd FileType nerdtree nmap <buffer> <left> u
" Remap the right arrow to enter a directory.
autocmd FileType nerdtree nmap <buffer> <right> C
" Close if just nerdtree remains
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Display hidden files:
let NERDTreeShowHidden=1
" Toggle display of the tree with <Leader> + n:
nmap <leader>] :NERDTreeToggle<CR>
" Locate the focused file in the tree with <Leader> + j:
nmap <leader>j :NERDTreeFind<CR>
" Do not display some useless files in the tree:
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
" Remove some extra info from nerdtree
let NERDTreeMinimalUI = 1

"
" Nerd Commenter
"
Plugin 'scrooloose/nerdcommenter'

"
" Finder
"
" need to fix this
" Plugin 'wincent/command-t'
" " To ignore some files, you can use wildignore:
" set wildignore+=*.log,*.sql,*.cache

"
" Fugitive
"
Plugin 'tpope/vim-fugitive'

"
" Lightline
"
Plugin 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
       \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ },
      \ }
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }

"
" Supertab
"
Plugin 'ervandew/supertab'

"
" GitGutter
"
Plugin 'airblade/vim-gitgutter'
set signcolumn=yes " always display the gutter - even when there are no changes.

" Plugin 'terryma/vim-multiple-cursors'
"
" Code Formatting
"
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-surround'
Plugin 'posva/vim-vue'
Plugin 'mustache/vim-mustache-handlebars'

autocmd FileType vue syntax sync fromstart
"
" Nerd Fonts
"
Plugin 'ryanoasis/vim-devicons'

" Track time spent
Plugin 'wakatime/vim-wakatime'

"
"Vim Jsx
"
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allow jsx syntax in js files

"
"Ale
"
Plugin 'w0rp/ale'
" Ale settings
" let g:ale_linters = {}
" let g:ale_linters['javascript'] = ['eslint']
" let g:ale_linters['jsx'] = ['eslint']
" let g:ale_fixers = {}
" let g:ale_fixers['javascript'] = ['prettier']
" let g:ale_fixers['jsx'] = ['prettier']
" let g:ale_fixers['scss'] = ['prettier']
" let g:ale_fixers['css'] = ['prettier']
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --print-width 100'
" let g:airline#extensions#ale#enabled = 1
" let g:ale_fix_on_save = 1

"
"Prettier
"
Plugin 'prettier/vim-prettier'
" Prettier Settings
" let g:prettier#config#print_width = 100
" let g:prettier#config#single_quote = 'true'
" let g:prettier#config#trailing_comma = 'es5'
" let g:prettier#config#bracket_spacing = 'true'
" let g:prettier#config#parser = 'babylon'

call vundle#end()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of iunused plugins; append `!` to auto-approve removal
