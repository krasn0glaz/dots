" ~/.vimrc
" ver 01122023
set nocompatible

" Packaging
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
filetype plugin on
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tribela/vim-transparent'
Plug 'dense-analysis/ale'
Plug 'hashivim/vim-terraform'
" Plug 'pearofducks/ansible-vim'

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'tpope/vim-fugitive' "Git!
" Plug 'chriskempson/base16-vim' "colors
" Plug 'joshdick/onedark.vim'
call plug#end()

function! MyLineNumber()
  return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). '/'.
    \    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction
call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})

let g:airline#extensions#tabline#formatter = 'default' "tab name format
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 "alter for gVim
let g:airline_skip_empty_sections = 1
let g:airline_section_z = airline#section#create(['%3p%% ', 'linenr', '%3v']) "line number section
let g:airline_section_y = '' "empty section Y

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_fixers = {
\	'*': ['remove_trailing_lines', 'trim_whitespace'],
\	'cpp': ['clang-format']
\}

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

let mapleader = '\'
nnoremap <Leader> <C-w>

map <F2> :w! <cr>
map <F9> :qa! <cr>
map <F10> :x! <cr>

nnoremap <C-s> :w <CR>

map <F3> :NERDTreeToggle <cr>
map <F4> :tabnew <cr>
map <F7> :set rnu! <cr>

if isdirectory('.terraform')
		autocmd FileType terraform map <F8> :!terraform fmt <cr>
		" autocmd FileType terraform map <F5> :!terraform plan
else
		autocmd FileType cpp nnoremap <buffer> <F5> :call Comp() <cr>
		autocmd FileType cpp nnoremap <buffer> <C-c> :call Comp() <cr>
		autocmd FileType cpp map <F8> :ALEFix <cr>
		autocmd FileType python nnoremap <buffer> <F5> :call PyRun() <cr>
		autocmd FileType python nnoremap <buffer> <C-c> :call PyRun() <cr>
endif

" if &filetype ==# 'cpp'
" 		nnoremap <F5> :call Comp() <cr>
" 		nnoremap <C-c> :call Comp() <cr>
" endif

fu! Comp()
    let filename=expand('%:t')
    echo filename
    execute '!comp' filename
endfunction

fu! PyRun()
    let filename=expand('%:t')
    echo filename
    execute '!python3' filename
endfunction

autocmd VimEnter * AirlineToggleWhitespace
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

set background=dark
colorscheme gruvbox " gruvbox gruvbox base16-ashes onedark xoria256
let g:airline_theme='gruvbox' "'gruvbox monochrome peaksea base16_ashes'
let g:gruvbox_italic=1
let g:gruvbox_transparent_bg=1
let g:gruvbox_contrast_dark='medium'

syntax on
set nu rnu "line numbers
set showcmd "show last command

set encoding=utf-8
set ff=unix
set backspace=2
set backspace=indent,eol,start
let g:netrw_banner=0
let g:netrw_liststyle=3
set title
set path+=**
set wildmenu
set completeopt=longest,menuone
set nowrap
set nolinebreak
set incsearch
set noshowmatch
set noshowmode
set smarttab
set shiftwidth=4
set tabstop=2
set ttimeoutlen=10
set laststatus=2
set noswapfile
set t_Co=256
set mouse=a
set guifont=Monaco:h16
set guicursor+=a:block-Cursor
set guicursor+=a-n-c:blinkon0
set clipboard=unnamed

if has("gui_running")
  let g:airline_powerline_fonts = 0
  set lines=40 columns=135
endif

" The END
