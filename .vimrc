" John Willard's .vimrc

" map ; to : in normal mode
nnoremap ; :

" print all opening brackets with closing brackets in insert mode
:inoremap ( ()<Esc>i
:inoremap [ []<Esc>i
:inoremap { {}<Esc>i
:inoremap ' ''<Esc>i
:inoremap " ""<Esc>i


syntax enable                               " syntax highlight

set t_Co=256                                " set 256 colors

set ignorecase                              " ignore case in search
set smartcase

set hidden                                  " allow buffers to be hidden

set nu                                      " show line numbers
set ruler                                   " show cursor location in status bar
set ls=2                                    " show filename
set ttyfast                                 " terminal acceleration

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set softtabstop=4
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8                               " utf-8 by default

set nobackup                                " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile                              " no swap files

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set clipboard=unnamed                       " use system clipboard

let mapleader=","                           " set <leader>

let &t_SI = "\<Esc>]50;CursorShape=1\x7"    " Vertical bar in insert mode
let &t_EI = "\<Esc>]50;CursorShape=0\x7"    " Block in normal mode
