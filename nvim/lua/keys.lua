local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts theni options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local opt = vim.opt


--
-- Neovim keybindings
--

-- Map leader key to ,
vim.g.mapleader = ','


-- Open / neovim configuration
map('n', '<Leader>ev', ':vsp $MYVIMRC<CR>')

-- Clear search
map('n', '<Leader>n', ':nohlsearch<CR>')

-- Reseize panes
map('', '<A-H>', '<C-W><', {silent})
map('', '<A-J>', '<C-W>-', {silent})
map('', '<A-K>', '<C-W>+', {silent})
map('', '<A-L>', '<C-W>>', {silent})

-- Navigate panes / buffers
map('n', '<C-H>', '<C-W><C-H>')
map('n', '<C-J>', '<C-W><C-J>')
map('n', '<C-K>', '<C-W><C-K>')
map('n', '<C-L>', '<C-W><C-L>')
map('n', '<C-x>', ':bdelete<CR>')
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


--
-- Plugin keybindings
--

map('n', '<C-N>', ':NvimTreeToggle<CR> | :NvimTreeRefresh<CR>')
map('n', '<Leader>z', ':sp | :Tnew | :resize 36<CR>')

--- Telescope
map('', '<Leader>f', ':Telescope file_browser<CR>')
map('', '<Leader>F', ':Telescope find_files<CR>')
map('', '<Leader>b', ':Telescope buffers<CR>')


--TODO: https://ustrajunior.com/posts/reloading-neovim-config-with-telescope/
