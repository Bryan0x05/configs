" ===== General sanity =====
set nocompatible              " Use modern Vim behavior
filetype plugin indent on     " Enable filetype detection

" ===== UI / Visual =====
" Hybrid relative-abs line number, save for insert mode which is abs.
:set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END
set cursorline                " Highlight current line
set showmatch                 " Highlight matching brackets
set scrolloff=8               " Keep 8 lines above/below cursor

" ===== Tabs / Indentation =====
set tabstop=4
set shiftwidth=4
set expandtab                 " Use spaces instead of tabs
set smartindent

" ===== Search =====
set smartcase                 " ...unless uppercase is used
set incsearch                 " Show matches while typing
set hlsearch                  " Highlight matches

" ===== Mouse =====
set mouse=a                   " Enable mouse support

" ===== Plugins =====
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugged')
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()

" ===== Colorscheme =====
set termguicolors
colorscheme catppuccin_mocha
