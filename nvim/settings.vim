"
" General settings
"

" Set to auto read when a file is changed from the outside
set autoread


" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11

set showmatch "Show matching bracets when text indicator is over them

" Wrap
let &showbreak = '↳ '
set wrap

" show cursor positon
set ruler

" show incomplete commands
set showcmd

" shows a menu when using tab completion 
set wildmenu

" turn on line numbering
set number relativenumber

" auto indent the next line
set ai

" smart indent
set si

" NerdTree
let NERDTreeShowHidden=1

" Fix nvim strange characters
set guicursor=

" Disable swap file warnings
set nobackup
set nowb
set noswapfile

" Persistent undo
set undodir=~/.vim_tmp/undodir
set undofile

set history=1000
set clipboard=unnamedplus
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab

" set relativenumber
set scrolloff=5
set hlsearch
set incsearch
set ignorecase
set smartcase
set lbr
set bg=dark
set hidden

