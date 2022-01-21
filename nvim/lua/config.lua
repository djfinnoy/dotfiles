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

---- Cursorline in active pane
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
cmd 'colorscheme nord'

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

-- nvim-lsp-installer
local lsp_installer = require "nvim-lsp-installer"

lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)

-- Include the servers you want to have installed by default below
local servers = {
  "bashls",
  "elixirls",
  "gopls",
  "terraformls",
  "yamlls",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

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

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['elixirls'].setup {
  capabilities = capabilities,
  cmd = { "/home/df/.local/share/nvim/lsp_servers/elixir/elixir-ls/language_server.sh" };
}
require('lspconfig')['terraformls'].setup {
  capabilities = capabilities
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
    "yaml"
  },
  ignore_install = { "elixir", "lua" }
}

-- vim-terraform
vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1

