" leader remap
let mapleader = ","
let g:mapleader = ","

" Fast editing of the .vimrc
map <leader>r :e! ~/.vimrc<cr>


imap jj <Esc>

map <C-z> ;

" Buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

" move lines 
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" Map space to / (search) and c-space to ? (backwards search)
map <space> /
map <silent> <cr> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" NerdTree
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>
