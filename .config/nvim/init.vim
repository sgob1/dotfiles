call plug#begin()
Plug 'ayu-theme/ayu-vim'
Plug 'catppuccin/nvim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edeneast/nightfox.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'freitass/todo.txt-vim'
Plug 'lervag/vimtex'
Plug 'morhetz/gruvbox'
Plug 'nlknguyen/papercolor-theme'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'projekt0n/github-nvim-theme'
Plug 'rebelot/kanagawa.nvim'
Plug 'sainnhe/edge'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/sonokai'
Plug 'sbdchd/neoformat'
Plug 'srcery-colors/srcery-vim'
Plug 'tanvirtin/monokai.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
call plug#end()

syntax on
filetype plugin on

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
set cursorline
set ruler
set number relativenumber
set tabstop=4
set shiftwidth=4
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
set list
set lcs=tab:»·
set lcs+=trail:·
set undofile
set viminfo=!,'100,<50,s100,%,/50,:50
set termguicolors
set background=dark

let g:adwaita_darker = 0
let g:adwaita_darker = 1
let g:adwaita_disable_cursorline = 0
let g:adwaita_transparent = 0
let g:everforest_background = 'hard'
let g:everforest_enable_bold = 1
let g:everforest_enable_italic = 1
let g:gruvbox_bold = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 1
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_diagnostic_text_highlight = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_foreground = 'material'
let g:gruvbox_material_visual = 'blue background'
let g:material_style = 'darker'
let g:shfmt_opt= '-ci'
let g:sonokai_enable_italic = 1
let g:sonokai_style = 'espresso'
let g:sonokai_style = 'shusia'
let g:vimtex_view_method = 'zathura'

nnoremap Y y$
nnoremap \\ :noh<cr>
let mapleader=","
nnoremap Q gq
nnoremap - /
inoremap <C-c> <ESC>
nnoremap <F2> :set background=dark<CR>
nnoremap <F3> :set background=light<CR>

command! MakeTags !ctags -R .
command Spelling :set spell spelllang=en,it
command SpellingItalian :set spell spelllang=it
command SpellingEnglish :set spell spelllang=en
command Nospelling :set nospell
command W :w

nnoremap <leader>figure o<ESC>:-1read $HOME/.snippets/latex-picture.tex<CR>2j$i
nnoremap <leader>code o<ESC>o<ESC>:-1read $HOME/.snippets/latex-code.tex<CR>o
nnoremap <leader>verb o<ESC>:-1read $HOME/.snippets/latex-verbatim.tex<CR>o
nnoremap <leader>table o<ESC>:-1read $HOME/.snippets/latex-table.tex<CR>2j$i
nnoremap <leader>enum o<ESC>:-1read $HOME/.snippets/latex-enum.tex<CR>jA
nnoremap <leader>item o<ESC>:-1read $HOME/.snippets/latex-item.tex<CR>jA
nnoremap <leader>desc o<ESC>:-1read $HOME/.snippets/latex-desc.tex<CR>jA
nnoremap <leader>eqn o<ESC>:-1read $HOME/.snippets/latex-eqn.tex<CR>7ea
nnoremap <leader>align o<ESC>:-1read $HOME/.snippets/latex-align.tex<CR>o
nnoremap <leader>ualign o<ESC>:-1read $HOME/.snippets/latex-ualign.tex<CR>o
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

colorscheme catppuccin-macchiato
