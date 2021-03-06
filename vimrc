" git clone https://github.com/vim/vim
" cd vim/src
" ./configure --enable-pythoninterp --with-features=huge --prefix=$HOME/opt/bin
" make && make install
" run tmux -2 for vim corlor support


" Automatic reloading .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy and paste
set pastetoggle=<F2>
set clipboard=unnamed

" make backspace behave like normal
set bs=2

" rebind <Leader> key
let mapleader = ","

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" show whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Enable syntax hightlighting
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and lenght
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Real programmer don't use Tabs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" highlight search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Diable backup and swap files
se nobackup
set nowritebackup
set noswapfile

" Setup pathogen to manage plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" " curl -so ~/.vim/autoload/pathogen.vim
" https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
call pathogen#infect()

" ============================================================================
" Python IDE Setup
"
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c> 
