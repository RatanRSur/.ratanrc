call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ciaranm/detectindent'
Plug 'flazz/vim-colorschemes'
Plug 'ervandew/supertab'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'powerline/fonts'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'benekastah/neomake'
Plug 'reedes/vim-lexical'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'sjl/vitality.vim'
Plug 'JuliaLang/julia-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ap/vim-css-color', { 'for' : 'css'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do' : '.install --all'}
call plug#end()
let g:plug_threads = 20
"set encoding=utf-8 "does this do anything?

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
nnoremap <Leader>d :DetectIndent<CR>
nnoremap <Leader>n :w<CR>:bn<CR>
nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>p :w<CR>:bp<CR>
"splits
set splitbelow
set splitright
"stop that stupid window from popping up
map q: :q
" line number stuff
set relativenumber
set cursorline
:inoremap <C-c> <Esc>
:set scrolloff=5 "scrolloff
syntax enable
colorscheme jellybeans
set colorcolumn=99 "for selfish reasons mwahahaha

"code beautification
noremap <Leader>a :Autoformat<CR>
" let g:autoformat_verbosemode=1
let g:formatdef_cplusplus = '"astyle --mode=c --style=java --indent=spaces=4
            \-xGfpHUxek3W3jOocxyxC80"'
let g:formatters_cpp = ['cplusplus']

"copy this line and comment it out, uses the <leader>cc mapping from nerdcommenter
map <Leader>cn yyp<Leader>ccl

"automatically turn folding on if file is longer than my screen
autocmd! BufWinEnter * if line('$')>winheight(0) | setlocal foldmethod=syntax | endif
nnoremap <leader>z :setlocal foldmethod=syntax<CR>
nnoremap za zA
nnoremap zA za

let g:neomake_cpp_enable_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++11", "-Wextra", "-Wall"]
autocmd! BufWritePost * Neomake "neomake stuff

"airline stuff
:set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='base16color'

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

"fzf
map <Leader>f :FZF<CR>
map <Leader>` :FZF ~<CR>
map <Leader>/ :FZF /<CR>
nnoremap <silent> <Leader>v :call fzf#run({
            \  'down': '50%',
            \  'sink': 'botright split' })<CR>

nnoremap <silent> <Leader>h :call fzf#run({
            \   'right': winwidth('.') / 2,
            \   'sink':  'vertical botright split' })<CR>
let $FZF_DEFAULT_COMMAND='ag
            \ --ignore .git
            \ --ignore undodir
            \ --ignore Library
            \ --ignore Applications
            \ --ignore macports
            \ --hidden -f -g ""'

autocmd! bufwritepost .nvimrc source % "auto source this file
