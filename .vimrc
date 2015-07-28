set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'ervandew/supertab'
Plugin 'Chiel92/vim-autoformat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'powerline/fonts'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'reedes/vim-lexical'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'sjl/vitality.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" leader space
let mapleader = "\<Space>"
" remap save and quit and stuff
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader><Leader>q :q!<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>e :e<Space>
nnoremap <Leader>sp :sp<Space>
nnoremap <Leader>vsp :vsp<Space>
"stop that stupid window from popping up
map q: :q
" line number stuff
set relativenumber
set cursorline
"scrolloff
:set scrolloff=5
"256 color terminal with syntax highlighting and colorscheme
set t_Co=256
syntax enable
colorscheme jellybeans
"airline status bar
:set laststatus=2
"code beautification
noremap <Leader>a :Autoformat<CR>
let g:formatdef_cplusplus = '"astyle --mode=c --style=1tbs --indent=spaces=8 -xGfpHUxek3W3jOocxyxC80"'
let g:formatters_cpp = ['cplusplus']
"syntastic stuff
let g:syntastic_cpp_compiler = 'clang'
let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'
"airline stuff
let g:airline_powerline_fonts = 1
"8 spaces as a tab
set expandtab
set tabstop=8
"better breaking
set breakindent
"backspace can go to previous line
set backspace=2
"menu listing
set wildmenu
"search stuff
set incsearch
set hlsearch
set ignorecase
set smartcase
"no sounds
set noerrorbells
set visualbell
"crypto
set cm=blowfish2
"up/down plays nice with wrapped lines
nnoremap j gj
nnoremap k gk
"lexical stuff
augroup lexical
        autocmd!
        autocmd FileType tex call lexical#init()
        autocmd FileType txt call lexical#init()
        autocmd FileType text call lexical#init({'spell':0})
augroup END
let g:lexical#spell_key = '<leader>s'
:set nosmd   " short for 'showmode'
:set noru    " short for 'ruler'
"trailing whitespace
:nnoremap <silent> <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR> :w<CR>
