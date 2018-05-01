call plug#begin('~/.config/nvim/plugged')

" Syntastic
Plug 'vim-syntastic/syntastic'

" Neoterm
Plug 'kassio/neoterm'

" Ensime / vim-scala
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/derekwyatt/vim-scala.git'

" Color schemes
Plug 'arcticicestudio/nord-vim'
Plug 'lifepillar/vim-solarized8'

" Pandoc integration
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" Spelling and grammar
Plug 'https://github.com/rhysd/vim-grammarous.git'

" R IDE
Plug 'https://github.com/jalvesaq/Nvim-R.git'

" Nerdtree file navigation
Plug 'https://github.com/scrooloose/nerdtree.git'

" Auto-close brackets {([
Plug 'https://github.com/Raimondi/delimitMate'

" FZF / Ctrlp for file navigation
Plug 'https://github.com/kien/ctrlp.vim.git'

" Buffer overview
Plug 'https://github.com/jeetsukumaran/vim-buffergator.git'

" LaTeX integration
Plug 'https://github.com/lervag/vimtex.git'

" Status line enhancement
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'

" <Leader><Leader><w> navigation
Plug 'https://github.com/easymotion/vim-easymotion.git'

" Automatic whitespace elimination
Plug 'https://github.com/thirtythreeforty/lessspace.vim.git'

" Insert mode completions with TAB
Plug 'https://github.com/ervandew/supertab.git'

" Auto-completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Better csv
Plug 'chrisbra/csv.vim', {'for': 'csv'}

call plug#end()

source $HOME/.config/nvim/general.vimrc
source $HOME/.config/nvim/plugins.vimrc
source $HOME/.config/nvim/keys.vimrc

