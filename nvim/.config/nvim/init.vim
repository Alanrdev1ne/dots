" nvim rc


""" Plugin Downloads

call plug#begin('~/.config/nvim/plugged')

    " files
    Plug 'scrooloose/nerdtree'
    Plug 'kien/ctrlp.vim'

    " style
    Plug 'itchyny/lightline.vim'
    Plug 'frazrepo/vim-rainbow'
    Plug 'morhetz/gruvbox'

    " programming
    Plug 'valloric/YouCompleteMe'
    Plug 'ervandew/supertab'
    Plug 'nvie/vim-flake8'
    Plug 'preservim/nerdcommenter'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'jmcantrell/vim-virtualenv'

    " quality of life
    Plug 'jiangmiao/auto-pairs'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'

    " typesetting
    Plug 'iamcco/markdown-preview.nvim'

call plug#end()

""" Plugin Settings

let g:Powerline_symbols='fancy'
let g:rainbow_active = 1

let g:lightline = { 'colorscheme': 'seoul256' }

" ultisnips

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

""" General Settings

let g:python_host_prog='/usr/bin/python'

" tabs

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" visual

colorscheme gruvbox

set nu
syntax on

let g:enable_bold_font=1
let g:enable_italic_font=1

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set laststatus=2

set incsearch
set hlsearch
set showmatch

" keymaps

nnoremap B ^
nnoremap E $

" leader key
map <space> <leader>

" clear search
nnoremap <leader>c :nohlsearch<CR>


" split windows rebinds

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitright

nnoremap j gj
nnoremap k gk

" copy/ paste

set clipboard=unnamedplus

" shebangs
autocmd bufnewfile *py call append(line("^"), ["#!/usr/bin/python3"])
autocmd bufnewfile *sh call append(line("^"), ["#!/bin/bash"])

" source rc on save
autocmd bufwritepost init.vim source %
