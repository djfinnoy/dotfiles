call plug#begin('~/.config/nvim/plugged')

" Color schemes
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'

" Status line enhancement
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'

" Nerdtree file navigation
Plug 'https://github.com/scrooloose/nerdtree.git'

" Auto-close brackets {([
Plug 'https://github.com/Raimondi/delimitMate'

" FZF / Ctrlp for file navigat"on
Plug 'https://github.com/kien/ctrlp.vim.git'

" Buffer overview
Plug 'https://github.com/jeetsukumaran/vim-buffergator.git'

" <Leader><Leader><w> navigation
Plug 'https://github.com/easymotion/vim-easymotion.git'

" Insert mode completions with TAB
Plug 'https://github.com/ervandew/supertab.git'

" Auto-completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" terraform syntax highlighting
Plug 'hashivim/vim-terraform'


call plug#end()

source $HOME/.config/nvim/general.vimrc
source $HOME/.config/nvim/plugins.vimrc
source $HOME/.config/nvim/keys.vimrc
