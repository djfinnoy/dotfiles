return require('packer').startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Appearance
  use 'arcticicestudio/nord-vim'         -- Colorscheme
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'kdheepak/tabline.nvim',
    requires = { {'kyazdani42/nvim-web-devicons', opt = true} }
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'BurntSushi/ripgrep'},
      {'sharkdp/fd'}
    }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'

  --
  -- Language server stuff
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer'
  }

  -- Misc
  use 'nvim-treesitter/nvim-treesitter'        -- Syntax highlighting
  use 'Raimondi/delimitMate'                   -- Auto-close bracket
  use 'kassio/neoterm'                         -- Terminal with REPL
  use 'ntpeters/vim-better-whitespace'         -- Handle whitespace
  use 'ggandor/lightspeed.nvim'
  use 'lambdalisue/suda.vim'
  use 'hashivim/vim-terraform'
  use 'elixir-editors/vim-elixir'
  use {
      'iamcco/markdown-preview.nvim',
      run = function() vim.fn['mkdp#util#install']() end,
      ft = {'markdown'}
  }
  use {                                        -- Auto-completions
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip'
    }
  }
end)

