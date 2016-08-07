set nocompatible
filetype off

call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'chrisbra/Colorizer'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

filetype plugin indent on

syntax on
set encoding=utf-8
set ffs=unix,dos,mac

set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim

" set theme
set background=dark
colorscheme solarized
let g:airline_theme='base16'

set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set autoindent
set smartindent
" set smarttab
set wrap                " wrap lines"
set scrolloff=5         " keep at least 5 lines above/below
set sidescrolloff=5     " kep at least 5 lines left/right
set backspace=indent,eol,start
set whichwrap+=<,>,h,l  " wrap
set linebreak
set number              " show line numbers
set ruler               " show line number on the bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]
set autoread            " watch for file changes
set ignorecase          " ignore case when searching
set smartcase           " try to be smart about casing when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level
set magic               " regular expression magic
set mouse=a             " use mouse
set history=1000        " lines of history vim will remember
set cmdheight=1         " cmd bar height
set laststatus=2        " always show status line

" format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" no error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" turn backups off (since everything should be in git anyway)
set nobackup
set nowb
set noswapfile

" leader is ,
let mapleader=","
let g:mapleader=","

" NERDTree shows hidden files
let NERDTreeShowHidden=1

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" space open/closes folds
nnoremap <space> za

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" jk is escape
inoremap jk <esc>

" F2 toggles NERDTree
map <F2> :NERDTreeToggle<CR>

" fast saving
nmap <leader>w :w!<CR>

" fast saving and quitting
nmap <leader>wq :wq!<CR>

" better moving between windows
map <C-j> <C-w>j
map <C-K> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" <leader>r is search and replace
noremap <silent> <leader>r :call VisualSelection('replace')<CR>

" <leader>ss toggles spell checking
map <leader>ss :setlocal spell!<CR>

" use powerline symbols with airline
let g:airline_powerline_fonts = 1

" specify the behavior when switching between buffers 
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" Remember info about open buffers on close
set viminfo^=%

" delete trailing white space on save
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


autocmd FileType *.js setlocal shiftwidth=2 tabstop=2 softtabstop=2
