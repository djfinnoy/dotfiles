" Airline
let g:airline_theme='nord'
"let g:airline_solarized_bg='dark'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2
let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#tabline#tab_nr_type = 2let g:airline#extensions#tabline#show_tabs = 0
"let g:airline#extensions#tabline#buffers_label = ''

" EasyMotion colors
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment

" deoplete
let g:deoplete#enable_at_startup = 1

" CtrlP
let g:ctrlp_working_path_mode = 'c'  " default dir = current file
