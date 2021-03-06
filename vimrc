set nocompatible
set rtp+=~/.vim/bundle/vundle
filetype on

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

source ~/.vim/startup/bundles.vim

" Powerline status line - fancy!
" source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

filetype plugin indent on


set modelines=0
syntax on
set t_Co=256
" Use the molokai colorscheme -- inspired by the TextMate version
colorscheme molokai

let mapleader = ","

set number
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
set expandtab
set smartindent
set autoindent
set showmatch

set ruler
set nocompatible
set fileformat=unix

" Enable mouse mode
set mouse=a

set showcmd
set wildmenu
set wildmode=list:longest
set ttyfast
set backspace=indent,eol,start
set showmode
set scrolloff=3
set laststatus=2

" Prevent slow scrolling of long lines
set synmaxcol=200

" Speed up vim
set ttyfast
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
set re=1

" Show characters on trailing while spaces
set list listchars=tab:\ \ ,trail:·

" Remove trailing spaces
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml,ruby autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.idea/*,.idea,*/.idea,*/.idea/*

" These are annoying and I never use them anyway
" set backupdir=~/.vim/backup//
" set backup
set nobackup
set noswapfile

set wrap
" set textwidth=119
set formatoptions=qrn1

set formatoptions+=l
" Not supported until version 7.3
"set colorcolumn=85
if version >= 703
  set colorcolumn=120
endif

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Force saving when needing to sudo first"
cnoreabbrev <expr> w!!
  \((getcmdtype() == ':' && getcmdline() == 'w!!')
  \?('!sudo tee % >/dev/null'):('w!!'))

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

map <F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F3> :TlistToggle<cr>
map <C-c> "+y<CR>
" line indent
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Prevent slow scrolling of long lines
set synmaxcol=200

" Speed up vim
set ttyfast
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
set re=1
set guifont=PragmataPro\ for\ Powerline:h14

if has("gui_running")
    set guioptions-=T "no toolbar for gui
    "set lines=30
    "set columns=80
    set cursorline
    set guifont=PragmataPro\ for\ Powerline:h14
    colorscheme wombat
    if has("gui_gtk2")
    elseif has("gui_win32")
    else
        let do_syntax_sel_menu = 1|runtime! synmenu.vim
        set transparency=0
        set guifont=PragmataPro\ for\ Powerline:h14
    endif
endif

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

autocmd BufReadPost *.doc silent %!antiword "%"
autocmd BufReadPost *.odt,*.odp silent %!odt2txt "%"
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w78
autocmd BufReadPost *.rtf silent %!unrtf --text "%"

autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead Berksfile set filetype=ruby
autocmd BufNewFile,BufRead *.rcl set filetype=ruby

" Turn on autocomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" enable filetype detection:
set nocp
filetype on
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.vhost set filetype=nginx

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent expandtab shiftwidth=4 tabstop=4 softtabstop=4

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
"autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
" show the `best match so far' as search strings are typed:
set incsearch
"set gdefault
set showmatch
set hlsearch


" folding settings
set foldmethod=indent   " fold based on indent
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " dont fold by default
set foldlevel=1         " set default fold level to 1


" Make these commonly mistyped commands still work
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

" Use :C to clear hlsearch
command! C nohlsearch

" Force write readonly files using sudo
command! WS w !sudo tee %

" Rebind autocomplete to ctrl-space
" inoremap <Nul> <C-x><C-o> 

" Super tab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"
"highlight Pmenu guibg=brown gui=bold
"highlight Pmenu ctermbg=238 gui=bold
" Add tags

"set tags+=$HOME/.vim/tags/python.ctags
"autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\" 
"autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 

au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.rb set expandtab softtabstop=2 tabstop=2 shiftwidth=2

"buffer explorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

nmap <leader>nt :NERDTreeToggle<cr>
map <F2> :NERDTreeToggle<cr>
map <leader>fd :NERDTreeFind<cr>

" Syntastic
"SyntasticDisable
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_enable_signs=1
"let g:syntastic_auto_jump=1
"let g:syntastic_auto_loc_list=1

autocmd bufwritepost .vimrc source $MYVIMRC

" Neocomplcache
"let g:neocomplcache_enable_at_startup = 1

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                "let file = fnamemodify(file, ':p:t')
                let file = fnamemodify(file, ':p:h:t').'/'.fnamemodify(file, ':t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

" Enable omni completion.
" Strip whitespace
function! StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
