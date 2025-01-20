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
opt.smartindent = false             -- Insert indents automatically
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
    theme = 'nord',
  },
  sections = {
    lualine_c = {
      {'filename', path = 4}
    }
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
      "terraformls",
      "pylsp",
      "gopls",
      "helm_ls",
      "lua_ls",
      "templ"
    }
})

require("mason-lspconfig").setup_handlers {
  -- automatically load installed language servers
  function (server_name)
      require("lspconfig")[server_name].setup {}
  end
}

require("lspconfig").typos_lsp.setup {
  filetypes = { "markdown" }
}

require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'E121', 'W391'},
          maxLineLength = 100
        }
      }
    }
  }
}

require'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "cmd",
          "vim",
          "use",
          "silent"
        }
      }
    }
  }
}

-- nvim-tree-sitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  ensure_installed = {
    "bash",
    "dockerfile",
    "hcl",
    "json",
    "yaml",
    "elixir",
    "lua",
    "python",
    "templ"
  }
}

-- telescope
require('telescope').setup {
  defaults = {
    preview = {
      treesitter = false,
    }
  },
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
opt.completeopt = "menuone,noselect"
local cmp= require('cmp')
local lspkind = require('lspkind')
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end
cmp.setup ({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  preselect = cmp.PreselectMode.None,
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = vim.schedule_wrap(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources(
    {
      { name = "nvim_lsp", group_index = 2 },
      { name = "path", group_index = 2 },
      { name = "luasnip", group_index = 2 },
    }, {
      {name = 'buffer' }
    }
  ),
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol",
      max_width = 50,
    })
  }
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

-- leap
require('leap').add_default_mappings()

-- indentation helper
require("ibl").setup()

-- neoterm
vim.g.neoterm_repl_python = 'ipython --no-autoindent'
vim.g.neoterm_clean_startup = 1
vim.g.neoterm_repl_ipython_magic = 1
vim.g.neoterm_repl_cellmarker = '^# %%'


-- templ
vim.filetype.add({
    extension = {
        templ = "templ",
    },
})

