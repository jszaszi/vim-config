"-- Plugins ------------------------------------------------------------------
call plug#begin(stdpath('data') . '/plugged')

" Colors
Plug 'arcticicestudio/nord-vim'
Plug 'gosukiwi/vim-atom-dark'

" Navigation
Plug 'preservim/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Utils
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'

call plug#end()
"-----------------------------------------------------------------------------


"-- Common -------------------------------------------------------------------
syntax on
colorscheme atom-dark

set nonumber
set foldcolumn=2
set termguicolors

set t_Co=256
set laststatus=2
set encoding=utf-8
set backspace=indent,eol,start

set visualbell
set noerrorbells

set autoread

set showcmd
set wildmenu
set wildoptions=
set hlsearch
set noincsearch
set nofoldenable

set splitright
set splitbelow

set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

set nowrap
set textwidth=0

set nobackup
set nowritebackup

" Faster git-gutter signs update
set updatetime=500

set nolist
hi ExtraWhitespace ctermbg=darkred  guibg=darkred
au BufWinEnter * match ExtraWhitespace /\s\+$/

let mapleader=","
"-----------------------------------------------------------------------------


"-- Language Specific --------------------------------------------------------
augroup go
    au!
    au FileType go,gomod setlocal tabstop=8
    au FileType go,gomod setlocal shiftwidth=8
    au FileType go,gomod setlocal softtabstop=0
    au FileType go,gomod setlocal noexpandtab
augroup END
"-----------------------------------------------------------------------------


"-- Color Scheme Modifications -----------------------------------------------
hi LineNr guibg=bg
hi FoldColumn guibg=bg
hi VertSplit guifg=bg guibg=#303030

" Airline tweaks
hi StatusLine guifg=#4C566A guibg=#dadada
hi StatusLineNC guifg=#3B4252 guibg=#4C566A

" Git-gutter tweaks
hi SignColumn guibg=bg
hi GitGutterAdd guibg=bg guifg=lightgreen
hi GitGutterDelete guibg=bg guifg=red
hi GitGutterChange guibg=bg guifg=orange
"-----------------------------------------------------------------------------


"-- Custom Mappings ----------------------------------------------------------
nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>l :call ToggleColorColumn()<CR>

" Allow copy and paste in gvim
vnoremap <C-C> "+y
inoremap <C-V> <C-O>"+gp

" Faster navigation between split windows
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

" Faster switching between tabs
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprev<CR>

" Close focused buffer
nnoremap <leader>db :bd<CR>
"-----------------------------------------------------------------------------


"-- NERDTree -----------------------------------------------------------------
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1

" When '-' is pressed, use vinegar instead of NERDTree
let g:NERDTreeHijackNetrw=0

nnoremap <leader>n :NERDTreeToggle<CR>
"-----------------------------------------------------------------------------


"-- NERDCommenter ------------------------------------------------------------
let g:NERDCreateDefaultMappings=0

map <leader>c <plug>NERDCommenterToggle
"-----------------------------------------------------------------------------


"-- Airline ------------------------------------------------------------------
let g:airline_section_y=''
let g:airline_section_z=''
"-----------------------------------------------------------------------------


"-- FZF ----------------------------------------------------------------------
nnoremap <leader>f :Files<CR>
nnoremap <leader>s :Ag<CR>
nnoremap <leader>b :Buffers<CR>
"-----------------------------------------------------------------------------


"-- SnipMate -----------------------------------------------------------------
let g:snipMate = { 'snippet_version' : 1 }
"-----------------------------------------------------------------------------


"-- Functions ----------------------------------------------------------------
function ToggleColorColumn()
    if &colorcolumn
        set colorcolumn=0
    else
        set colorcolumn=91
    endif
endfunction
"-----------------------------------------------------------------------------
