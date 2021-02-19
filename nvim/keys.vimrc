" Map the leader key to ,
let mapleader="\,"

" Easier dollar (Norwegian keyboard)
map ¤ $
imap ¤ $

" Leader bindings
noremap <Leader>ev :vsp $MYVIMRC<CR>
noremap <Leader>EV :so %<CR>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>O :CtrlPBuffer<CR>
noremap <Leader>n :nohlsearch<CR>
nmap <Leader>s :%s//g<Left><Left>
nmap <Leader>r :%s/\%V/g<Left><Left>
nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9

" Open NERDtree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Navigate splits
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>

" Navigate tabs
nnoremap <C-W>c :tabnew<CR>
nnoremap <C-W>gt :tabnext<CR>
nnoremap <C-W>gT :tabprev<CR>
nnoremap <C-W>x :tabclose<CR>

" Navigate buffers
nnoremap gt :bnext<CR>
nnoremap gT :bprevious<CR>
nnoremap <C-x> :bdelete<CR>

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>

" Close all tabs except current
nnoremap <Leader>xa :w <bar> %bd <bar> e# <bar> bd# <CR>

" Terminal keys
tnoremap <C-C> <C-\><C-n>
tnoremap <C-K> <C-\><C-n><C-W><C-K>
tnoremap <C-L> <C-\><C-n><C-W><C-L>
tnoremap <C-H> <C-\><C-n><C-W><C-H>
tnoremap <C-J> <C-\><C-n><C-W><C-J>
tnoremap <C-X> <C-\><C-n>:q!<CR>
nnoremap <Leader>z :sp term://zsh <bar> :resize 20<CR>

