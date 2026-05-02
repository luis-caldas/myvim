" Plugin configuration

function! ConfigurePlugins() abort
    " netrw
    let g:netrw_banner = 0
    let g:netrw_liststyle = 3
    let g:netrw_browse_split = 4
    let g:netrw_altv = 1
    nnoremap <silent> <leader>e :Lexplore<CR>

    " Haskell
    let g:haskell_indent_disable = 1

    " gitgutter
    let g:gitgutter_terminal_reports_focus = 0

    " quickfix
    nnoremap <silent> <leader>m :silent make<CR>:cwindow<CR>
    nnoremap <silent> <leader>q :cwindow<CR>
endfunction
