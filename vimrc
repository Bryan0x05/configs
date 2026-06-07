" ===== General sanity =====
set nocompatible              " Use modern Vim behavior
filetype plugin indent on     " Enable filetype detection

" ===== UI / Visual =====
set number relativenumber     " Show line numbers
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

colorscheme elflord
