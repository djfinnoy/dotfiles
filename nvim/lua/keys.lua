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
map('n', '<C-W>gt', ':tabnext<CR>')
map('n', '<C-W>gT', ':tabprev<CR>')
map('n', '<C-W>x', ':tabclose<CR>')
map('n', '<C-W>c', ':tabnew<CR>')

-- Terminal
map('t', '<ESC>', [[<C-\><C-n>]])
map('t', '<C-X>', [[<C-\><C-n>:q!<CR>]])
map('t', '<C-H>', [[<C-\><C-n><C-W><C-H>]])
map('t', '<C-J>', [[<C-\><C-n><C-W><C-J>]])
map('t', '<C-K>', [[<C-\><C-n><C-W><C-K>]])
map('t', '<C-L>', [[<C-\><C-n><C-W><C-L>]])

-- Misc
map('n', '<Leader>ev', ':vsp $MYVIMRC<CR>')
map('n', '<Leader>n', ':nohlsearch<CR>')
map('', '¤', '$')


--
-- Plugin keybindings
--

--- Telescope
map('', '<Leader>f', ':Telescope find_files<CR>')
map('', '<Leader>b', ':Telescope buffers<CR>')
map('', '<Leader>s', ':Telescope live_grep<CR>')
map('', '<Leader>F', '<cmd>lua require \'telescope\'.extensions.file_browser.file_browser()<CR>')
map('n', '<Leader>p', ':Telescope neoclip<CR>')

-- Neoterm
map('n', '<Leader>z', ':sp | :Tnew<CR> | :set ma<CR>')
map('n', '<C-E>', ':TREPLSendLine<CR>')
map('v', '<C-E>', ':TREPLSendSelection<CR>')

-- Markdown preview
map('n', '<Leader>md', ':MarkdownPreviewToggle<CR>')

-- Lightspeed
map('n', 'c', 'cl')  -- Make `c` behave like `s` does without the lightspeed plugin

-- Toggle LSP diagnostics
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

