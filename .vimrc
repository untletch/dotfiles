set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" plugin for syntax linting
Plugin 'vim-syntastic/syntastic'

" Plugin for syntax linting
Plugin 'dense-analysis/ale'

" plugin for comments
Plugin 'tomtom/tcomment_vim'

" Plugin for file tree
Plugin 'preservim/nerdtree' 

" Plugin for searching files
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Plugin for auto pairing brackets
Plugin 'jiangmiao/auto-pairs'

" Plugin for solarized
Plugin 'altercation/vim-colors-solarized'

" Plugin for vim colorschemes
Plugin 'flazz/vim-colorschemes'

" Plugin for syntax highlighting
Plugin 'sheerun/vim-polyglot'

" Plugin for html
Plugin 'mattn/emmet-vim'

" Plugin for html-tags
Plugin 'Valloric/MatchTagAlways'

" Plugin for go language
Plugin 'fatih/vim-go'

" Plugin for svelte syntax highlighting
Plugin 'evanleck/vim-svelte'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Colors 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
syntax on
if has('gui_running')
  colorscheme solarized8_dark
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Spaces and Tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=','                 " Set the map leader to ,

" Formatting&indentation for python files
au BufNewFile,BufRead *.py
    \ set tabstop=4               " Number of spaces for tabs
    \ set softtabstop=4           " Let backspace delete indent  
    \ set shiftwidth=4            " Use indents of four spaces
    \ set fileformat=unix         " Prevent python errors due to conversion issues
    \ set encoding=utf-8        " Encoding for python 3

set tabstop=2                     " Number of spaces for tabs
set shiftwidth=2                  " Use indents of four spaces
set expandtab                     " Tabs are spaces, not tabs
set softtabstop=2                 " Let backspace delete indent
set textwidth=79                  " Maximum width of text being inserted
set autoindent                    " Indent at the same level of the previous line
set smartindent                   " Do clever autoindenting

" Enable folding for classes and functions
set foldmethod=indent
set foldlevel=99


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                        " Line numbers on
set backspace=indent,eol,start    " Backspace to delete normally
set showmatch                     " Show matching brackets/parenthesis
set title                         " Show info in the window title

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set clipboard=unnamedplus            " Allow vim to use the system clipboard as the default register
set hlsearch                         " Highlight all matches for the last used search pattern
set ignorecase                       " Ignore case when using a search pattern
set smartcase                        " Override 'ignorecase' when pattern has upper case characters
set incsearch                        " Show match for partly typed search command
set splitbelow                       " New horizontal split screen is set below
set splitright                       " New vertical split screen is set to the right

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable arrow-keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" press i to enter insert mode and jj to exit.
:imap jj <Esc>

" Split screen navigations
" <C-W>w move between terminal and window
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" fzf
" :Files

" Syntastic
" Remember to pip install flake8 and black
" Show Gvim where flake8 is installed
let g:syntastic_python_flake8_exec = '$HOME/miniconda3/bin/flake8'

" Ale
" List of languages for ale to use
" Remember to npm install eslint and prettier
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\   'svelte': ['eslint'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'html': ['prettier'],
\   'go': ['gometalinter', 'gofmt'],
\}

" Only run linters named in ale_linters settings
let g:ale_linters_explicit = 1

let g:ale_fixers = {
  \    'javascript': ['prettier'],
  \    'typescript': ['prettier', 'tslint'],
  \    'vue': ['prettier'],
  \    'svelte': ['prettier'],
  \    'css': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt'],
  \    'python': ['black'],
  \    'go': ['gofmt'],
  \    'rust': ['rustfmt'],
\}

" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

" Only run linters on save
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" C++ syntastic linting
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++14'
"
"
" Emmet
" Use ,, for html5 snippet
let g:user_emmet_leader_key=','
" Only enable normal mode functions.
let g:user_emmet_mode='n'    

" NerdTree
" Use ',' and n
map <leader>n :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2   " The number of file indents to be shown
let NERDTreeShowHidden = 1  " Show hidden files

" Go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'svelte' : 1,
    \}

" Folding Key
nnoremap <space> za


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Shortcuts 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shortcuts to remember
    ":sp --> split window horizontally
    ":vp --> split window vertically
    ":Files --> (fzf) To search for files
    "gs --> (nerdTree) open files
    "m --> (nerdTree) add files to dirs
    "ctrl + ww --> For split window navigation
    "y --> Copy
    "yy --> Copy line
    "p --> Paste
    "a --> Insert after cursor
    "dd --> Delete line
    "d --> Delete word
    "o --> Insert after newline
    "b --> Beginning of word
    "e --> End of word
    "> --> Indent
    ". --> Repeats command
    "s --> Substitute character
    "c --> Change
    ":1,34delete, yank, join move --> Ex commands
    "* --> to search for word pointed to by cursor
    ":p --> Ex command to print
    ":s --> Ex command to substitute
    ":% --> all lines in current file
    ":%s/cat/donkey --> substitutes cat for donkey in all places in file
    "shift + g --> End of File
    "= --> autoindent
    "* + c + w --> search for word when cursor is on word and replace
    "shift + s --> substitute a line
    "gcc --> to comment
    "gi --> go back to cursor insert mode
