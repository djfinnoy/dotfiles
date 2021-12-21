vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

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
    config = function()
      require'tabline'.setup {
        enable = true,
      }
      vim.cmd[[
        set guioptions-=e " Use showtabline in gui vim
        set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]]
    end,
    requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
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
  --
  -- Language server stuff
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer'
  }

  -- Misc
  use 'nvim-treesitter/nvim-treesitter'        -- Syntax highlighting
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
  use 'Raimondi/delimitMate'                   -- Auto-close bracket
  use 'kassio/neoterm'                         -- Terminal with REPL
  use 'ntpeters/vim-better-whitespace'         -- Handle whitespace
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use 'ggandor/lightspeed.nvim'

end)

