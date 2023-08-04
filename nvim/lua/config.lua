local cmd = vim.cmd
local opt = vim.opt

--
-- Neovim settings
--
opt.expandtab = true                -- Use spaces instead of tabs
opt.hidden = true                   -- Enable background buffers
opt.ignorecase = true               -- Ignore case
opt.joinspaces = false              -- No double spaces with join
opt.number = true                   -- Show line numbers
opt.ruler = true                    -- Cursor coordinates
opt.scrolloff = 4                   -- Lines of context
opt.shiftround = true               -- Round indent
opt.shiftwidth = 2                  -- Size of an indent
opt.showmatch = true                -- Show matching bracets
opt.smartcase = true                -- Do not ignore case with capitals
opt.smartindent = true              -- Insert indents automatically
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new windows right of current
opt.tabstop = 2                     -- Number of spaces tabs count for
opt.termguicolors = true            -- True color support
opt.wrap = false                    -- Disable line wrap

-- Cursorline in active pane
vim.api.nvim_command([[
  augroup CursorLineOnlyInActiveWindow
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
  augroup END
]])

-- Syntax highlighting for *.tpl files
vim.api.nvim_command('au BufRead,BufNewFile *.y*ml.tpl set filetype=yaml')
vim.api.nvim_command('au BufRead,BufNewFile *.json.tpl set filetype=json')

-- No linenumbers in terminal panes
vim.api.nvim_command('au TermOpen * setlocal nonumber norelativenumber')

-- Spell check in certain filetypes
vim.api.nvim_command([[
  augroup spellcheck
    au FileType markdown setlocal spell spelllang=en_gb
    au BufRead,BufNewFile *.md setlocal spell spellang=en_gb
  augroup END
]])

--
-- Plugin settings
--

--- Nord
vim.g.nord_borders = true
vim.g.nord_bold = false
vim.g.nord_italic = false
require('nord').set()

--- Lua line / tabline
require'lualine'.setup {
  options = {
    theme = 'nord'
  }
}

require'tabline'.setup {
  enable = true,
  options = {
    show_filename_only = true
  }
}

-- mason / lsp-config
require("mason").setup()
require("mason-lspconfig").setup()

--- language servers
require("mason-lspconfig").setup({
    ensure_installed = {
      "bashls",
      "elixirls",
      "gopls",
      "terraformls",
      "yamlls",
      "jedi_language_server"
    }
})

require("mason-lspconfig").setup_handlers {
  -- automatically load installed language servers
  function (server_name)
      require("lspconfig")[server_name].setup {}
  end
}

-- nvim-tree-sitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  ensure_installed = {
    "bash",
    "dockerfile",
    "go",
    "hcl",
    "json",
    "yaml",
    "elixir",
    "lua"
  }
}

-- telescope
require('telescope').setup {
  pickers = {
    find_files = {
      theme = "dropdown"
    }
  },
  extensions = {
    file_browser = {
      theme = "dropdown"
    }
  }
}

-- vim-better-whitespace
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0
vim.g.better_whitespace_guicolor = 'Gray'
vim.g.current_line_whitespace_disabled_soft = 1

-- nvim-cmp (autocompletions)
opt.completeopt = "menu,menuone,noselect"
local cmp= require'cmp'
cmp.setup ({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  },
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp'},
      { name = 'vsnip' }
    }, {
      {name = 'buffer' }
    }
  )
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- vim-terraform
vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1

-- go.nvim
require('go').setup()

-- neoclip
require'telescope'.load_extension('neoclip')

-- leap
require('leap').add_default_mappings()
