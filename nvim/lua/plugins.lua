return {
  -- Appearance
  'shaunsingh/nord.nvim',
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  'nvim-lualine/lualine.nvim',
  'kdheepak/tabline.nvim',

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'sharkdp/fd'
    }
  },
  'nvim-telescope/telescope-file-browser.nvim',

  -- Language server
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',

  -- Language specific plugins
  'fatih/vim-go',
  'hashivim/vim-terraform',
  'elixir-editors/vim-elixir',
  'towolf/vim-helm',
  'Vimjas/vim-python-pep8-indent',

  -- Misc
  'preservim/nerdtree',
  'nvim-treesitter/nvim-treesitter',        -- Syntax highlighting
  'Raimondi/delimitMate',                   -- Auto-close bracket
  'kassio/neoterm',                         -- Terminal with REPL
  'lukas-reineke/indent-blankline.nvim',    -- Indentation guides
  'lambdalisue/suda.vim',
  {
    'ggandor/leap.nvim',
    dependencies = {
      'tpope/vim-repeat',
    }
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {                                        -- Auto-completions
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim'
    }
  },

}
