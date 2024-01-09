set nocompatible
syntax on

set hidden
set path+=**
set wildmenu
set showcmd
set confirm
set nopaste
set history=100
set undolevels=100
set backspace=indent,eol,start
set nomodeline
set noexpandtab
set nostartofline
set foldmethod=indent
set nofoldenable
set autoindent
set copyindent
set belloff=all
set ruler
set number relativenumber
set tabstop=8
set shiftwidth=8
set expandtab
set smarttab
set shiftround
set ignorecase
set smartcase
set scrolloff=1
set novisualbell noerrorbells
set splitbelow splitright
set autoread
set laststatus=2
set shortmess=at
set cmdheight=1
set notimeout
set nottimeout
set incsearch hlsearch
set mouse=v
"set list
set list!
set listchars=tab:\|\ ,trail:·
"set lcs=tab:»·
set lcs+=trail:·
set undodir=~/.vim/undodir
set undofile
set viminfo=!,'100,<50,s100,%,/50,:50
set background=dark

set termguicolors

nnoremap Y y$
nnoremap \\ :noh<cr>
let mapleader=","
nnoremap Q gq
nnoremap - /
inoremap <C-c> <ESC>
inoremap <ESC> <ESC><ESC>
nnoremap <F2> :set background=dark<CR>
nnoremap <F3> :set background=light<CR>

highlight LineNr ctermfg=grey

command! MakeTags !ctags -R .
command Spelling :set spell spelllang=en,it
command SpellingItalian :set spell spelllang=it
command SpellingEnglish :set spell spelllang=en
command Nospelling :set nospell
command W :w

nnoremap <leader>header o<ESC>:-1read $HOME/.snippets/latex-header.tex<CR>137i
nnoremap <leader>figure o<ESC>:-1read $HOME/.snippets/latex-picture.tex<CR>2j$i
nnoremap <leader>code o<ESC>o<ESC>:-1read $HOME/.snippets/latex-code.tex<CR>o
nnoremap <leader>verb o<ESC>:-1read $HOME/.snippets/latex-verbatim.tex<CR>o
nnoremap <leader>table o<ESC>:-1read $HOME/.snippets/latex-table.tex<CR>2j$i
nnoremap <leader>enum o<ESC>:-1read $HOME/.snippets/latex-enum.tex<CR>jA
nnoremap <leader>item o<ESC>:-1read $HOME/.snippets/latex-item.tex<CR>jA
nnoremap <leader>desc o<ESC>:-1read $HOME/.snippets/latex-desc.tex<CR>jA
nnoremap <leader>eqn o<ESC>:-1read $HOME/.snippets/latex-eqn.tex<CR>o
nnoremap <leader>math o<ESC>:-1read $HOME/.snippets/latex-math.tex<CR>o
nnoremap <leader>array o<ESC>:-1read $HOME/.snippets/latex-array.tex<CR>jo
nnoremap <leader>quote o<ESC>:-1read $HOME/.snippets/latex-quote.tex<CR>j3ei
nnoremap <leader>mm <ESC>:read $HOME/.snippets/latex-marginpar.tex<CR>7ela
nnoremap <leader>tt i\texttt{
inoremap <leader>tt \texttt{
nnoremap <leader>ee i\emph{
inoremap <leader>ee \emph{
nnoremap <leader>bb i\textbf{
inoremap <leader>bb \textbf{
nnoremap <leader>cc i\textsc{
inoremap <leader>cc \textsc{

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
call plug#end()

let base16colorspace=256  " Access colors present in 256 colorspace
let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_italic=1
colorscheme catppuccin_mocha
