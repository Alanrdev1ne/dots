"
"   /$$$$$$  /$$                    /$$              /$$    /$$ /$$
"  /$$__  $$| $$                   | $/             | $$   | $$|__/
" | $$  \ $$| $$  /$$$$$$  /$$$$$$$|_//$$$$$$$      | $$   | $$ /$$ /$$$$$$/$$$$   /$$$$$$   /$$$$$$$
" | $$$$$$$$| $$ |____  $$| $$__  $$ /$$_____/      |  $$ / $$/| $$| $$_  $$_  $$ /$$__  $$ /$$_____/
" | $$__  $$| $$  /$$$$$$$| $$  \ $$|  $$$$$$        \  $$ $$/ | $$| $$ \ $$ \ $$| $$  \__/| $$
" | $$  | $$| $$ /$$__  $$| $$  | $$ \____  $$        \  $$$/  | $$| $$ | $$ | $$| $$      | $$
" | $$  | $$| $$|  $$$$$$$| $$  | $$ /$$$$$$$/         \  $/   | $$| $$ | $$ | $$| $$      |  $$$$$$$
" |__/  |__/|__/ \_______/|__/  |__/|_______/           \_/    |__/|__/ |__/ |__/|__/       \_______/
"

"
"==========[Plugin_Settings]=========================================================================
"

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Rip-Rip/clang_complete'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'dylanaraps/wal.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'flazz/vim-colorschemes'
Plugin 'gko/vim-coloresque'
Plugin 'itchyny/lightline.vim'
Plugin 'jceb/vim-orgmode'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jnurmine/Zenburn'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'morhetz/gruvbox'
Plugin 'neomake/neomake'
Plugin 'nvie/vim-flake8'
Plugin 'prettier/vim-prettier'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sfi0zy/atlantic-dark.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'valloric/YouCompleteMe'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'vim-scripts/LanguageTool'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'xuhdev/vim-latex-live-preview'

" Haskell
Plugin 'neovimhaskell/haskell-vim'


call vundle#end()
filetype plugin indent on


" Plugin Configurations

" latex viewer

let g:livepreview_previewer = 'zathura'

" lightline

let g:lightline = {
    \ 'colorscheme': 'wombat'
    \ }

" nerdtree

map <S-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" easymotion

map <Leader> <Plug>(easymotion-prefix)

" auto close html tags

au FileType xhtml,xml so ~/.vim/ftplugin/html_autoclosetag.vim
let g:languagetool_jar = "/usr/bin/LanguageTool"


"==========[General_Settings]========================================================================

" File Settings

set encoding=utf-8
set fileformat=unix

" Leader Key

map <Space> <Leader>

" Copy/ Paste

set clipboard=unnamedplus

" Tab Settings

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Visual Settings

syntax on

colorscheme wal

let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:hybrid_custom_term_colors = 1
let g:hybrid_transparent_background = 1

highlight Comment cterm=italic
set background=dark
set cmdheight=1
set number
set relativenumber
set ruler
set scrolloff=20
set wrap

" Highlight Whitespace

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Highlight search

set incsearch
set hlsearch
set showmatch

" leader maps

nnoremap <leader>c :nohlsearch<CR>

" move to beginning/end of line

nnoremap B ^
nnoremap E $

" Split windows rebinds

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitright

" Move vertically by visual line

nnoremap j gj
nnoremap k gk

" Other, un-documented stuff

set laststatus=2

"==========[Python_Settings]=========================================================================


autocmd BufNewFile *py call PythonTemplate()

autocmd fileType py set colorcolumn=80
autocmd filetype py nnoremap <F5> :!python3 %<CR>

let g:pymode_python = "python3"
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_syntax_all = 1

if has('python3')
  silent! python3 1
endif


"==========[java]====================================================================================


autocmd fileType java setlocal omnifunc=javacomplete#Complete
autocmd filetype java nnoremap <F4> :JCimportsAddMissing<CR>
autocmd filetype java nnoremap <F5> :!javac %<CR>
autocmd filetype java nnoremap <F6> :!java %:r<CR>
autocmd BufNewFile *java call JavaTemplate()


"==========[RMD Specific]============================================================================


autocmd BufNewFile *rmd call RmarkdownTemplate()
autocmd BufRead *rmd set spell spelllang=en_gb
autocmd BufWritePost *rmd :!pandoc -o %:r.html %
autocmd BufWritePost *rmd :LanguageToolCheck


"==========[Auto commands]=====================================================


autocmd bufwritepost .vimrc source %


"==========[Functions]=========================================================


" Adds shabang and if/main to new python files

function! PythonTemplate()
    call append(line("^"), ["#!/usr/bin/python3",
                \           "",
                \           "",
                \           "def main():",
                \           "    pass"])
    call append(line("$"), ["",
                \           "if __name__ == \"__main__\":",
                \           "    main()"])
endfunction

" Adds basic class structure to java file

function! JavaTemplate()
    let class_name = "public class " . expand('%:r') . " {"
    call append(line("^"), [class_name,
                \           "",
                \           "    public static void main(String[] args) {",])
    call append(line("$"), ["",
                \           "    }",
                \           "}"])
endfunction


" Adds basic markdown template

function! RmarkdownTemplate()
    call append(line("^"), ["---",
                \           "Title:",
                \           "Lecturer:",
                \           "output: html_document",
                \           "---"])
endfunction

" Removes delay form changing modes

augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END
