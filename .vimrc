
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
"
"==========[Plugin_Settings]=========================================================================


set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'Shougo/neocomplcache.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'VundleVim/Vundle.vim'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'flazz/vim-colorschemes'
Plugin 'gko/vim-coloresque'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jnurmine/Zenburn'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'neomake/neomake'
Plugin 'nvie/vim-flake8'
Plugin 'prettier/vim-prettier'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sfi0zy/atlantic-dark.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'vim-scripts/LanguageTool'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'w0ng/vim-hybrid'


call vundle#end()
filetype plugin indent on

" Plugin Configurations

" Neocomplete,

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'

" supertab

let g:SuperTabDefaultCompletionType = "<c-n>"

" lightline

let g:lightline = {
    \ 'colorscheme': 'wombat'
    \ }

" java autocomplete2

autocmd FileType java setlocal omnifunc=javacomplete#Complete

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

colorscheme hybrid_material

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
autocmd FileType py set colorcolumn=80

let g:pymode_python = "python3"
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_syntax_all = 1

if has('python3')
  silent! python3 1
endif


"==========[java]====================================================================================


autocmd BufNewFile *java call JavaTemplate()


"==========[RMD Specific]============================================================================


autocmd BufNewFile *rmd call RmarkdownTemplate()
autocmd BufRead *rmd set spell spelllang=en_gb
autocmd BufWritePost *rmd :!pandoc -o %:r.html %
autocmd BufWritePost *rmd :LanguageToolCheck


"==========[Auto commands]=====================================================

autocmd bufwritepost .vimrc source %

" compile and run java program
autocmd filetype java nnoremap <F5> :!javac %<CR>
autocmd filetype java nnoremap <F6> :!java %:r<CR>


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
