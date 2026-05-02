" Plugin configuration

function! ConfigurePlugins() abort
    " netrw
    let g:netrw_banner = 0
    let g:netrw_liststyle = 3
    let g:netrw_browse_split = 0
    let g:netrw_altv = 1
    nnoremap <silent> <leader>e :Lexplore<CR>

    " Haskell
    let g:haskell_indent_disable = 1

    " gitgutter
    let g:gitgutter_terminal_reports_focus = 0
    let g:gitgutter_sign_added = '+'
    let g:gitgutter_sign_modified = '~'
    let g:gitgutter_sign_removed = '-'
    let g:gitgutter_sign_removed_first_line = '^'
    let g:gitgutter_sign_modified_removed = '*'

    " quickfix
    nnoremap <silent> <leader>m :silent make<CR>:cwindow<CR>
    nnoremap <silent> <leader>q :cwindow<CR>
endfunction
