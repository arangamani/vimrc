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
Bundle 'dzeban/vim-log-syntax'
Bundle 'plasticboy/vim-markdown'
Bundle 'jez/vim-superman'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'vim-scripts/AnsiEsc.vim'
Bundle 'leafgarland/typescript-vim'
Bundle 'avakhov/vim-yaml'

"Html/Javascript/Angular
Bundle 'burnettk/vim-angular'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/javascript-libraries-syntax.vim'


let g:notes_directories = ['~/Google Drive/Notes']
let g:notes_suffix = '.txt'
let g:notes_smart_quotes = 0

Bundle 'xolox/vim-misc'

set laststatus=2
let g:airline_powerline_fonts = 1

" Go support
Bundle 'fatih/vim-go'
Bundle 'nsf/gocode'
Bundle 'dgryski/vim-godef'

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Some nice mappings from vim-go: https://github.com/fatih/vim-go#mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

" ====== Ctrl P =======
Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore="/\(.log$\|public\/\)"
map <C-e> :CtrlPMRUFiles<CR>

" ====== Nerd Tree =======
Bundle 'scrooloose/nerdtree'
let g:NERDTreeDirArrows=1
let g:NERDTreeShowHidden=1

" autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" nmap <leader>ne :NERDTree<cr>
let NERDTreeIgnore = ['\.pyc$','\.o$']
