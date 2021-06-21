" Airline
let g:airline_theme='nord'
"
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2
let g:airline#extensions#tabline#buffer_idx_mode = 1

" EasyMotion colors
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment

" deoplete
let g:deoplete#enable_at_startup = 1

" vim-terraform (via polyglot)
let g:terraform_align=1  " align settings automatically
let g:terraform_fmt_on_save=1  " terraform fmt on save

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" buffergator
let g:buffergator_viewport_split_policy = "T"

" Close nerdtree after opening a file
let NERDTreeQuitOnOpen=1

" CtrlP
let g:ctrlp_show_hidden = 1
