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

" Plugin for svelte syntax highlighting
Plugin 'evanleck/vim-svelte'

" Plugin for git
Plugin 'airblade/vim-gitgutter'

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
set t_Co=256
if has('gui_running')
  colorscheme solarized8_dark
else
    colorscheme molokai
    " disable mouse activity when using vim
    set mouse=
    set ttymouse=
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
" Hybrid numbering
set number                        " Line numbers on
set relativenumber                " current line is number 0

set backspace=indent,eol,start    " Backspace to delete normally
set showmatch                     " Show matching brackets/parenthesis
set title                         " Show info in the window title
set cursorline                    " Highlight current line 
set laststatus=2                  " Show status line at all times

" Statusline
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\ 
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l/%L
set statusline+=\ :%c
set statusline+=\ 

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

" enter terminal mode using ','t
tnoremap <leader>t <c-w>N
" build and run code
autocmd Filetype python nmap <leader>r :w<CR>:!clear;pypy3 %<CR>
autocmd Filetype rust nmap <leader>r :w<CR>:!clear;cargo run<CR>
autocmd Filetype go nmap <leader>r :w<CR>:!clear;go run .<CR>
autocmd Filetype cpp nmap <leader>r :w<CR>:!clear;g++ -O2 -Wall a.cpp -o a && ./a > output.txt<CR>

" use ,q to exit
" nnoremap <leader>q :wq <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable arrow-keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" press i to enter insert mode and jj to exit.
imap jj <Esc>

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

" Ale
" List of languages for ale to use
" Remember to npm install eslint and prettier
" sudo npm i -g eslint-plugin-react eslint-plugin-react(hooks/native/redux)
" sudo apt install clang-tidy
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\   'svelte': ['eslint'],
\   'react': ['eslint'],
\   'css': ['stylelint', 'prettier'],
\   'scss': ['prettier'],
\   'html': ['prettier'],
\   'go': ['golangci-lint', 'gofmt'],
\   'python': ['flake8'],
\   'cpp': ['clangtidy'],
\   'c': ['clangtidy'],
\}

" Only run linters named in ale_linters settings
let g:ale_linters_explicit = 1

" Run 'rustup component add rustfmt'
let g:ale_fixers = {
  \    'javascript': ['prettier'],
  \    'typescript': ['prettier', 'tslint'],
  \    'vue': ['prettier'],
  \    'svelte': ['prettier'],
  \    'react': ['prettier'],
  \    'css': ['stylelint', 'prettier'],
  \    'html': ['prettier'],
  \    'python': ['black', 'isort'],
  \    'go': ['gofmt', 'goimports'],
  \    'rust': ['rustfmt'],
  \    'cpp': ['clangtidy', 'clang-format'],
  \    'c': ['clangtidy', 'clang-format'],
\}

" Only run linters on save
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

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

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'svelte' : 1,
    \ 'jsx' : 1,
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
