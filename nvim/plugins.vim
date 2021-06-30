" Plugins 
call plug#begin('~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'

call plug#end()

" Set colorscheme
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox

" make it transparent
hi Normal guibg=NONE ctermbg=NONE

" Gundo
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
 
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#ale#enabled = 1
set laststatus=2

" FZF
" let g:fzf_preview_window = ['up:40%', 'ctrl-/']
let g:fzf_history_dir = '~/.fzf-history'
let $FZF_DEFAULT_OPTS = '--reverse'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Rg<Cr>


" CoC config
so ~/.dotfiles/nvim/coc.vim

