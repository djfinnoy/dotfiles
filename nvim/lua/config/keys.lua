local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local opt = vim.opt

--
-- Neovim keybindings
--
-- Map leader key to ,
vim.g.mapleader = ','

-- Reload config
function _G.reload_config()
  for name,_ in pairs(package.loaded) do
    if name:match('^user') and not name:match('nvim-tree') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

map('n', '<Leader>ev', '<cmd>lua reload_config()<CR>', {noremap = true, silent = true})


-- Reseize panes
map('', '<A-h>', '<C-W><', {silent})
map('', '<A-j>', '<C-W>-', {silent})
map('', '<A-k>', '<C-W>+', {silent})
map('', '<A-l>', '<C-W>>', {silent})

-- Navigate panes / buffers
map('n', '<C-H>', '<C-W><C-H>')
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<C-x>', ':bdelete!<CR>')
map('n', 'gt', ':bnext<CR>')
map('n', 'gT', ':bprev<CR>')

-- Navigate tabs
map('n', '<C-W>x', ':tabclose<CR>')
map('n', '<C-W>c', ':tabnew<CR>')

-- Navigate errors
map('n', '<Leader>e', '<cmd> lua vim.diagnostic.goto_next()<CR>')
map('n', '<Leader>E', '<cmd> lua vim.diagnostic.goto_prev()<CR>')

-- Terminal
map('t', '<ESC>', [[<C-\><C-n>]])
map('t', '<C-X>', [[<C-\><C-n>:q!<CR>]])
map('t', '<C-H>', [[<C-\><C-n><C-W><C-H>]])
map('t', '<C-J>', [[<C-\><C-n><C-W><C-J>]])
map('t', '<C-K>', [[<C-\><C-n><C-W><C-K>]])
map('t', '<C-L>', [[<C-\><C-n><C-W><C-L>]])

-- Misc
map('n', '<Leader>n', ':nohlsearch<CR>')
map('', '¤', '$')
map('i', '<C-t>', '|>')
--
-- Plugin keybindings
--

--- Telescope
map('', '<Leader>f', ':Telescope find_files<CR>')
map('', '<Leader>b', ':Telescope buffers<CR>')
map('', '<Leader>s', ':Telescope live_grep<CR>')
map('', '<Leader>S', ':Telescope lsp_references<CR>')
map('', '<Leader>F', '<cmd>lua require \'telescope\'.extensions.file_browser.file_browser()<CR>')

-- Neoterm
map('n', '<Leader>t', ':Tnew<CR> | :set ma<CR>')
map('n', '<Leader>z', ':sp | :Tnew<CR> | :set ma<CR>')
map('n', '<Leader>Z', ':vsp | :Tnew<CR> | :set ma<CR>')
map('n', '<A-e>', ':TREPLSendFile<CR>')
map('n', '<C-e>', ':TREPLSendLine<CR>')
map('v', '<C-e>', ':TREPLSendSelection<CR>')

-- Markdown preview
map('n', '<Leader>md', ':MarkdownPreviewToggle<CR>')

-- LSP diagnostics
vim.g.diagnostics_visible = true
function _G.toggle_diagnostics()
  if vim.g.diagnostics_visible then
    vim.g.diagnostics_visible = false
    vim.diagnostic.disable()
  else
    vim.g.diagnostics_visible = true
    vim.diagnostic.enable()
  end
end
map('n', '<Leader>l', ':call v:lua.toggle_diagnostics()<CR>', {silent})

map("n", "<Leader>ll", ':lua vim.diagnostic.open_float()<CR>' )

-- vim-go
map('n', '<leader>gd', '<Plug>(go-def-split)')
map('n', '<leader>gl', '<Plug>(go-rename)')

-- NERDTree
map('n', '<C-n>', ':NERDTreeToggle<CR>')
