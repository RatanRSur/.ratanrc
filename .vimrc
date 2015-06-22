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
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'flazz/vim-colorschemes'
Plugin 'ervandew/supertab'
Plugin 'Chiel92/vim-autoformat'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'powerline/powerline'
Plugin 'powerline/fonts'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'reedes/vim-lexical'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

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
" line number stuff
set relativenumber
"256 color terminal with syntax highlighting and colorscheme
set t_Co=256
syntax enable
colorscheme jellybeans
"code beautification
let g:formatprg_cpp = "astyle"
let g:formatprg_args_cpp = "--style=allman --indent=spaces=4 -xC80 -pHfxek3COj"
"syntastic stuff
let g:syntastic_cpp_compiler = 'clang'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"airline stuff
let g:airline_powerline_fonts = 1
set expandtab
set tabstop=4
set backspace=2
set wildmenu
set incsearch
set hlsearch
"crypto
set cm=blowfish2 
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
