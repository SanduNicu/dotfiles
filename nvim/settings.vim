"
" General settings
"

" When vimrc is edited, reload it
autocmd! bufwritepost ~/.dotfiles/vim/vimrc.symlink source ~/.vimrc
autocmd! bufwritepost ~/.dotfiles/vim/settings.vim source ~/.vimrc
autocmd! bufwritepost ~/.dotfiles/vim/maps.vim source ~/.vimrc
autocmd! bufwritepost ~/.dotfiles/vim/plugins.vim source ~/.vimrc

" Set to auto read when a file is changed from the outside
set autoread
"
" Fast saving
nmap <C-s> :w!<CR>

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

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
set number

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

