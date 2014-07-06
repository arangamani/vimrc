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
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'


" ====== Ctrl P =======
Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore="/\(.log$\|public\/\)"
map <C-e> :CtrlPMRUFiles<CR>

" ====== Nerd Tree =======
Bundle 'scrooloose/nerdtree'
let g:NERDTreeDirArrows=1

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" nmap <leader>ne :NERDTree<cr>
nmap <leader>nt :NERDTreeToggle<cr>
map <F2> :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$','\.o$']
