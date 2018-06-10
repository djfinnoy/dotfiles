" Map the leader key to ,
let mapleader="\,"

" Easier dollar
map ¤ $
imap ¤ $

" Select all with ,a
nmap <Leader>a gg0vG$<CR>

" Remap O and o to stay in normal mode
nmap o o<Esc>
nmap O O<Esc>

" Leader bidings
noremap <Leader>ev :tabnew $MYVIMRC<CR>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>O :CtrlPBuffer<CR>
noremap <Leader>n :nohlsearch<CR>
nmap <Leader>s :%s//g<Left><Left>
nmap <Leader>r :%s/\%V/g<Left><Left>
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Open NERDtree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Navigate splits 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>

" Navigate buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-x> :bdelete<CR>

" Exit neovim terminal with Esc
tnoremap <Esc> <C-\><C-n>
"
" Markdown
autocmd FileType markdown nnoremap <buffer> <Leader>l :Pandoc latex -s<CR>

" Ensime
nnoremap <localleader>t :EnTypeCheck<CR>

" Syntastic
nnoremap <localleader>T :SyntasticToggleMode<CR>

" R
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

nmap <silent> <LocalLeader>H :call RAction("head")<CR>
imap <silent> <LocalLeader>H :call RAction("head")<CR>
vmap <silent> <LocalLeader>H :call RAction("head")<CR>
nmap <silent> <LocalLeader>T :call RAction("table")<CR>
imap <silent> <LocalLeader>T :call RAction("table")<CR>
vmap <silent> <LocalLeader>T :call RAction("table")<CR>

" neoterm
nnoremap <localleader>nt :vertical Tnew<CR>
autocmd FileType scala,python nmap <Space> <Plug>(neoterm-repl-send-line)
autocmd FileType scala,python xmap <Space> <Plug>(neoterm-repl-send)


