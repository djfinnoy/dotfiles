" No linenumber in Neovim terminal
au TermOpen * setlocal nonumber norelativenumber

" Unicode encoding
set encoding=utf-8

" Spelling  - activate with setlocal spell
set spelllang=en
set spellfile=$HOME/.config/nvim/en.utf-8.add

" Colorscheme settings
syntax enable
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
"set background=dark
colorscheme nord
highlight LineNr term=bold cterm=NONE ctermfg=white ctermbg=NONE gui=NONE guifg=white guibg=NONE

" Enable folding (za)
set foldmethod=indent
set foldlevel=99

" Python
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

" Miscellaneous
set hidden
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set textwidth=0         " Hard-wrap long lines as you type them.
set noerrorbells        " No beeps.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands

set ignorecase          " Make searching case insensitive
set smartcase " ... unless the query has capital letters.
