" Neoterm
let g:neoterm_autoscroll = 1
let g:neoterm_auto_repl_cmd = 0
" Ensime
"autocmd BufWritePost *.scala silent :EnTypeCheck

" vim-pandoc
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0

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

" nvim-R
autocmd VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif  " Auto-quit when exiting nvim

let R_assign = 0  " Disable _ = <-

" Vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'mupdf'
if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
endif

" deoplete
let g:deoplete#enable_at_startup = 1

" CtrlP
let g:ctrlp_working_path_mode = 'c'  " default dir = current file

" grammarous
let g:grammarous#use_vim_spellang = 1

" vim-scala
let g:scala_use_builtin_tagbar_defs = 0 " Using ~/.ctags instead of default
let g:scala_scaladoc_indent = 1 " Scaladoc indent style

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
