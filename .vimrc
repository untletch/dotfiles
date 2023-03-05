call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'

" Plugin for syntax linting
Plug 'dense-analysis/ale'

" Plugin for comments
Plug 'tomtom/tcomment_vim'

" Plugin for file tree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" Plugin for searching files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plugin for auto pairing brackets
Plug 'jiangmiao/auto-pairs'

" Plugin for multiple cursors
Plug 'mg979/vim-visual-multi'

" Plugin for colorscheme
Plug 'tomasr/molokai'

" Plugin for syntax highlighting
Plug 'sheerun/vim-polyglot'

" Plugin for html
Plug 'mattn/emmet-vim'

" Plugin for html-tags
Plug 'Valloric/MatchTagAlways'

" Plugin for svelte syntax highlighting
Plug 'evanleck/vim-svelte', { 'for': 'svelte' }

" Plugin for display colors from hexcodes
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Plugin for git
Plug 'tpope/vim-fugitive'
"https://jeancharles.quillet.org/posts/2022-03-02-Practical-introduction-to-fugitive.html
Plug 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call plug#end()
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PlugInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PlugUpdate     - install or update plugins
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h plug for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Colors 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
syntax on
colorscheme molokai
" disable mouse activity when using vim
set mouse=
set ttymouse=


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
set statusline+=\ %f                                          " File name
set statusline+=%m\                                           " modified flag
set statusline+=\%{FugitiveStatusline()}                     " Current git branch
set statusline+=%=                                            " Align left
set statusline+=\ Buf:%n                                      " Buffer number
set statusline+=\ %y                                          " Filetype
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}    " File encoding
set statusline+=\[%{&fileformat}\]                            " EOL of the current buffer
set statusline+=\ %p%%                                        " File percentage
set statusline+=\ %l/%L                                       " Current line / Total lines
set statusline+=\ :%c                                         " Current column
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
autocmd Filetype python nmap <leader>r :w<CR>:!clear;python %<CR>
autocmd Filetype rust nmap <leader>r :w<CR>:!clear;cargo run<CR>
autocmd Filetype go nmap <leader>r :w<CR>:!clear;go run .<CR>
autocmd Filetype c nmap <leader>r :w<CR>:!clear;gcc -O2 -Wall -Wextra % -o out && ./out<CR>
autocmd Filetype cpp nmap <leader>r :w<CR>:!clear;g++ -O2 -Wall a.cpp -o a && ./a > output.txt<CR>

" use ,q to exit
" nnoremap <leader>q :wq <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable arrow-keys in insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Disable arrow-keys in normal mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Disable arrow-keys in visual mode
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

" press i to enter insert mode and jj to exit.
" imap jj <Esc>

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
\   'typescript': ['eslint'],
\   'javascriptreact': ['eslint'],
\   'typescriptreact': ['eslint'],
\   'vue': ['eslint'],
\   'svelte': ['eslint'],
\   'css': ['prettier', 'stylelint'],
\   'scss': ['stylelint'],
\   'html': ['prettier'],
\   'go': ['gofmt', 'golangci-lint'],
\   'python': ['flake8', 'pylama'],
\   'cpp': ['clangtidy'],
\   'c': ['clangtidy'],
\   'sql': ['sqlfluff'],
\   'sh': ['shellcheck'],
\}

" Only run linters named in ale_linters settings
let g:ale_linters_explicit = 1

" Check the whole golang package instead of a single file
" let g:ale_go_golangci_lint_package = 1

" Run 'rustup component add rustfmt'
let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['eslint', 'prettier'],
  \    'javascriptreact': ['prettier'],
  \    'typescriptreact': ['prettier'],
  \    'vue': ['eslint', 'prettier'],
  \    'svelte': ['eslint'],
  \    'css': ['prettier', 'stylelint'],
  \    'scss': ['prettier', 'stylelint'],
  \    'json': ['prettier', 'jq'],
  \    'html': ['prettier'],
  \    'python': ['black', 'isort'],
  \    'go': ['gofmt', 'goimports'],
  \    'rust': ['rustfmt'],
  \    'cpp': ['clangtidy', 'clang-format'],
  \    'c': ['clangtidy', 'clang-format'],
  \    'sql': ['sqlfmt', 'sqlfluff'],
  \    'sh': ['shfmt'],
\}

" Only run linters on save
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0

" Fzf
if line('$') == 1 && getline(1) == ''
    nnoremap <Space>f :FZF<CR>
else
    nnoremap <Space>f :w<CR>:FZF<CR>
endif

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
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'svelte' : 1,
    \ 'jsx' : 1,
    \}

" Autopairs
au FileType rust     let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})
au FileType html     let b:AutoPairs = AutoPairsDefine({'{%' : '%}'})

" Change htmldjango to html
au FileType htmldjango set filetype=html

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
