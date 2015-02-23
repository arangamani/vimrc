set nocompatible
set rtp+=~/.vim/bundle/vundle
" call pathogen#infect()
filetype on
" filetype plugin indent on

"YouCompleteMe
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-tbone'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rbenv'
Bundle 'godlygeek/tabular'
Bundle 'gcmt/taboo.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'
Bundle 'xolox/vim-notes'
Bundle 'jistr/vim-nerdtree-tabs'

let g:notes_directories = ['~/Google Drive/Notes']
let g:notes_suffix = '.txt'

Bundle 'xolox/vim-misc'

set laststatus=2
let g:airline_powerline_fonts = 1

" Go support
Bundle 'fatih/vim-go'

" ====== Ctrl P =======
Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore="/\(.log$\|public\/\)"
map <C-e> :CtrlPMRUFiles<CR>

" ====== Nerd Tree =======
Bundle 'scrooloose/nerdtree'
let g:NERDTreeDirArrows=1

" autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" nmap <leader>ne :NERDTree<cr>
let NERDTreeIgnore = ['\.pyc$','\.o$']
