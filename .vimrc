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
Plugin 'ciaranm/detectindent'
Plugin 'flazz/vim-colorschemes'
Plugin 'ervandew/supertab'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Chiel92/vim-autoformat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'powerline/fonts'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'reedes/vim-lexical'
"Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'sjl/vitality.vim'
Plugin 'JuliaLang/julia-vim'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Put your non-Plugin stuff after this line

" undo stuff
set undofile
set undodir=~/.vim/undodir
let mapleader = "\<Space>" " space leader
" remap stuff with leader
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader><Leader>q :q!<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>e :e<Space>
nnoremap <Leader>h :vsp<Space>
nnoremap <Leader>v :sp<Space>
nnoremap <Leader>d :DetectIndent<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
"splits
set splitbelow
set splitright
"stop that stupid window from popping up
map q: :q
" line number stuff
set number
"set relativenumber
"set cursorline
:inoremap <C-c> <Esc>
:set scrolloff=5 "scrolloff
set t_Co=256 "256 color terminal with syntax highlighting and colorscheme
syntax enable
colorscheme jellybeans

"code beautification
noremap <Leader>a :Autoformat<CR>
autocmd! BufWritePre *.py Autoformat
let g:formatdef_cplusplus = '"astyle --mode=c --style=java --indent=spaces=4 -xGfpHUxek3W3jOocxyxC80"'
let g:formatters_cpp = ['cplusplus']

"syntastic stuff
let g:syntastic_cpp_compiler = 'clang'
let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'

"airline stuff
:set laststatus=2
let g:airline_powerline_fonts = 1

"spaces as tabs
set expandtab
set shiftwidth=4
set softtabstop=4

set breakindent "better breaking

set backspace=2 "backspace can go to previous line

set wildmenu "menu listing

"search stuff
set incsearch
set hlsearch
set ignorecase
set smartcase

"no sounds
set noerrorbells
set visualbell

"more sensible direction keys
noremap j gj
noremap k gk

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

"remove trailing whitespace
:nnoremap <silent> <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"tmux stuff
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-j> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-k> :TmuxNavigateDown<cr>
nnoremap <silent> <c-l> :TmuxNavigateUp<cr>
nnoremap <silent> <c-w>; :TmuxNavigateRight<cr>
nnoremap <silent> <c-/> :TmuxNavigatePrevious<cr>

" nerd tree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1 " show hidden files in nerd
