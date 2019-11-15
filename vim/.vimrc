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
autocmd BufWritePre * :%s/\s\+$//e " remove whitespaces on save.
map <leader>h :noh<cr>

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
"Ale
"
Plugin 'https://github.com/dense-analysis/ale'
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

"
"Prettier
"
Plugin 'prettier/vim-prettier', {'do':'yarn install'}

call vundle#end()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of iunused plugins; append `!` to auto-approve removal
