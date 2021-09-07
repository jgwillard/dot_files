"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

" Be iMproved
set nocompatible

"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

    Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required

    "-------------------=== Code/Project navigation ===-------------
    Plugin 'scrooloose/nerdtree'                " Project and file navigation
    Plugin 'ctrlpvim/ctrlp.vim'                 " Fast transitions on project files
    Plugin 'FelikZ/ctrlp-py-matcher'
    Plugin 'majutsushi/tagbar'                  " Class/module browser
    Plugin 'craigemery/vim-autotag'
    Plugin 'mileszs/ack.vim'

    "-------------------=== Other ===-------------------------------
    Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim
    Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
    Plugin 'Lokaltog/powerline'                 " Powerline fonts plugin
    Plugin 'rosenfeld/conque-term'              " Consoles as buffers
    Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
    Plugin 'flazz/vim-colorschemes'             " Colorschemes
    Plugin 'rafi/awesome-vim-colorschemes'      " Awesome colorschemes
    Plugin 'tpope/vim-fugitive'                 " Git wrapper so awesome, it should be illegal
    Plugin 'w0rp/ale'                           " Asynchronous Lint Engine

    "-------------------=== Snippets support ===--------------------
    Plugin 'garbas/vim-snipmate'                " Snippets manager
    Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
    Plugin 'tomtom/tlib_vim'                    " dependencies #2
    Plugin 'honza/vim-snippets'                 " snippets repo

    "-------------------=== Languages support ===-------------------
    Plugin 'tpope/vim-commentary'               " Comment stuff out
    Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
    Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin

    "-------------------=== Python  ===-----------------------------
    Plugin 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
    Plugin 'davidhalter/jedi-vim'               " Jedi-vim autocomplete plugin
    Plugin 'scrooloose/syntastic'               " Syntax checking plugin for Vim

    "-------------------=== TypeScript ===--------------------------
    Plugin 'HerringtonDarkholme/yats.vim'       " Syntax highlighting
    Plugin 'mhartington/nvim-typescript'
    Plugin 'Shougo/deoplete.nvim'               " Async completion
    Plugin 'Shougo/denite.nvim'                 " Denite features
    " Syntax highlighting for HTML template literals
    Plugin 'jonsmithers/vim-html-template-literals'

call vundle#end()                           " required

filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================

source ~/.vimrc

colorscheme gruvbox                         " set color scheme
set termguicolors

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

"=====================================================
"" Search settings
"=====================================================
set incsearch                               " incremental search
set hlsearch                                " highlight search results

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='base16_spacemacs'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

"=====================================================
"" ctrlp settings
"=====================================================
set wildignore+=*/__pycache__/*
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|tox)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|tox)$',
  \ 'file': '\v\.(exe|so|dll|pyc|pyo)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
"autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose
"nmap ; :TagbarToggle<CR>

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
"autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>

"=====================================================
"" SnipMate settings
"=====================================================
let g:snippets_dir='~/.config/nvim/bundle/vim-snippets/snippets'
let g:snipMate = { 'snippet_version' : 1 }

"=====================================================
"" Riv.vim settings
"=====================================================
let g:riv_disable_folding=1

let g:ackprg = 'ag --vimgrep'

"=====================================================
"" TypeScript settings
"=====================================================
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}

"=====================================================
"" Python settings
"=====================================================

" omnicomplete
set completeopt-=preview                    " remove omnicompletion dropdown

let g:python3_host_prog = '~/.envs/nvim/bin/python'  " Python 3
"let g:loaded_python_provider = 1

" python executables for different plugins
let g:pymode_python='python3'
let g:syntastic_python_python_exec='python3'
" let g:jedi#force_py_version=3

" rope
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0

" documentation
let g:pymode_doc=0
let g:pymode_doc_key='K'

" lints
let g:pymode_lint=0

" virtualenv
let g:pymode_virtualenv=1
let g:pymode_virtualenv_path=$VIRTUAL_ENV

" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'
let g:pymode_options_max_line_length=120

" jedi-vim
let g:jedi#popup_select_first=0             " Disable choose first option on autocomplete
let g:jedi#show_call_signatures=0           " Show call signatures
let g:jedi#popup_on_dot=1                   " Enable autocomplete on dot
