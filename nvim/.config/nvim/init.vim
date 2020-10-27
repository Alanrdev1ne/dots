" nvim rc

""" Plugin Downloads

" vim-plug is a dependency -> https://github.com/junegunn/vim-plug

call plug#begin('~/.config/nvim/plugged')

    " files
    Plug 'preservim/nerdtree'                                   " File browser
    Plug 'kien/ctrlp.vim'                                       " Fuzzy file finder

    " style
    Plug 'itchyny/lightline.vim'                                " Adds nicer status bar
    Plug 'frazrepo/vim-rainbow'                                 " Adds different colours for nested brackets
    Plug 'arcticicestudio/nord-vim'                             " Nord Color scheme

    " programming
    Plug 'valloric/YouCompleteMe'                               " Code completion engine
    Plug 'ervandew/supertab'                                    " Tab through code completion
    Plug 'nvie/vim-flake8'                                      " Adds python linting
    Plug 'SirVer/ultisnips'                                     " Adds snippet support
    Plug 'honza/vim-snippets'                                   " Adds default snippets for ultra snips

    " Version Control
    Plug 'tpope/vim-fugitive'                                   " Adds git commands within vim
    Plug 'airblade/vim-gitgutter'                               " Adds sidebar with changes

    " quality of life
    Plug 'jiangmiao/auto-pairs'                                 " Automatically closes paired characters
    Plug 'terryma/vim-multiple-cursors'                         " Multiple cursors
    Plug 'tpope/vim-commentary'                                 " Quickly comment out lines
    Plug 'tpope/vim-surround'                                   " Quickly chages surrouning brackets
    Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }   " Adds colour background to html colours

    " typesetting
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

call plug#end()

""" Plugin Settings

let g:Powerline_symbols='fancy'
let g:rainbow_active = 1

let g:lightline = { 'colorscheme': 'seoul256' }

" Nerd Tree

map <C-m> :NERDTreeToggle<CR>

"

let g:flake8_show_in_gutter = 1

" Markdown Preview

let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_browser = 'firefox'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" HTML Colour display

let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

" ultisnips

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

""" General Settings

let g:python_host_prog='/usr/bin/python'

set termguicolors

" tabs

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" visual

colorscheme nord

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
