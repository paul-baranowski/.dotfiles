colorscheme tomorrow-night
set nocompatible
syntax on
" set modifiable
filetype on
set lines=35 columns=150
set colorcolumn=90
set number
set background=dark
" " let mapleader=","
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
" remove whitespaces on save.
autocmd BufWritePre * :%s/\s\+$//e
set hlsearch
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

" " Re-Open Previously Opened File
" move back and forth between two files by pressing the Leader key twice.
nnoremap <Leader><Leader> :e#<CR>
" " When selecting a parenthesis it will highlight the one matching:
" set showmatch

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


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
" Open new files in a split
autocmd FileType nerdtree nmap <buffer> <CR> s
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
let NERDTreeMinimalUI = 1



" Finder
" Plugin 'wincent/command-t'
" To ignore some files, you can use wildignore:
" set wildignore+=*.log,*.sql,*.cache
" Here a way to reindex everything by simply pressing <Leader>+r:
noremap <Leader>r :CommandTFlush<CR>
" Plugin 'itchyny/lightline.vim'
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ }
" Plugin 'ervandew/supertab'
" Plugin 'airblade/vim-gitgutter'
" always display the gutter - even when there are no changes.
" set signcolumn=yes
" Plugin 'terryma/vim-multiple-cursors'
" " Code Formatting
" Plugin 'pangloss/vim-javascript'
" Plugin 'mattn/emmet-vim'
" Plugin 'ap/vim-css-color'
" Plugin 'tpope/vim-surround'
" Plugin 'posva/vim-vue'
" Plugin 'mustache/vim-mustache-handlebars'
" Track time spent
Plugin 'wakatime/vim-wakatime'
call vundle#end()
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
