return require('packer').startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Appearance
  use 'shaunsingh/nord.nvim'  -- Colorscheme
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'nvim-tree/nvim-web-devicons', opt = true}
  }
  use {
    'kdheepak/tabline.nvim',
    requires = { {'nvim-tree/nvim-web-devicons', opt = true} }
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

  -- Language server stuff
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }

  -- Language specific stuff
  use 'hashivim/vim-terraform'
  use 'elixir-editors/vim-elixir'
  use 'ray-x/go.nvim'

  -- Misc
  use 'nvim-treesitter/nvim-treesitter'        -- Syntax highlighting
  use 'Raimondi/delimitMate'                   -- Auto-close bracket
  use 'kassio/neoterm'                         -- Terminal with REPL
  use 'ntpeters/vim-better-whitespace'         -- Handle whitespace
  use {
    'ggandor/leap.nvim',
    requires = {
      'tpope/vim-repeat',
    }
  }
  use 'lambdalisue/suda.vim'
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
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require('neoclip').setup()
    end,
  }
end)

