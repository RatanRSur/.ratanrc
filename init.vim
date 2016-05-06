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
Plug 'wellle/targets.vim'
Plug 'JuliaLang/julia-vim'
Plug 'ap/vim-css-color', { 'for' : 'css'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do' : '.install --all'}
call plug#end()
let g:plug_threads = 20

" undo stuff
set undofile
set undodir=~/.vim/undodir

let mapleader = "\<Space>" " space leader
" remap stuff with leader
nnoremap <Leader>w :update<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader><Leader>q :q!<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>e :e<Space>
nnoremap <Leader>n :w<CR>:bn<CR>
nnoremap <Leader>d :bdelete<CR>
nnoremap <Leader>p :w<CR>:bp<CR>

"splits
set splitbelow
set splitright

"stop that stupid window from popping up
map q: :q

" other mappings
nmap Y y$
nmap <silent> <CR> :nohl<CR>

" line number stuff
set relativenumber
set cursorline

"cursorline only if focused
augroup highlight_follows_focus
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END
augroup highlight_follows_vim
    autocmd!
    autocmd FocusGained * set cursorline
    autocmd FocusLost * set nocursorline
augroup END

"make arrow keys do something useful
nnoremap <silent> <Left> :vertical resize +2<CR>
nnoremap <silent> <Right> :vertical resize -2<CR>
nnoremap <silent> <Up> :resize -2<CR>
nnoremap <silent> <Down> :resize +2<CR>

inoremap <C-c> <Esc>
syntax enable
colorscheme jellybeans
if has("mac")
    set colorcolumn=99 "for selfish reasons mwahahaha
endif

"code beautification
noremap <Leader>a :Autoformat<CR>

" let g:autoformat_verbosemode=1
let g:formatdef_cust_cpp = '"astyle --mode=c --style=java --indent=spaces=4 -xGfpHUxek3W3jOocxyxC98"'
let g:formatters_cpp = ['cust_cpp']
let g:formatdef_cust_c = '"astyle --mode=c --style=java --indent=spaces=4 -fpHUxek3W3jOocxC98"'
let g:formatters_c = ['cust_c']


"turn on manual folding always
"turn syntax folding on if file is longer than my screen
setlocal foldmethod=manual
autocmd! BufWinEnter * if line('$')>winheight(0) | setlocal foldmethod=syntax | endif
nnoremap <leader>z :setlocal foldmethod=syntax<CR>
nnoremap za zA
nnoremap zA za

let g:neomake_cpp_enable_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++11", "-Wextra", "-Wall"]
autocmd! BufWritePost * Neomake "neomake stuff

"airline stuff
let g:airline_powerline_fonts = 1
let g:airline_theme='base16color'

"spaces as tabs
set expandtab
set shiftwidth=4
set softtabstop=4

set breakindent "better breaking

"search stuff
set ignorecase
set smartcase
 
"trying out no wrap
set nowrap
set sidescroll=1

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

"jump to last opened position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

autocmd! bufwritepost init.vim source % "auto source this file
autocmd! bufwritepost .nvimrc source % "auto source this file
