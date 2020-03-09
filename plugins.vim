
function! ConfigurePlugins(is_unicode)

    " NERD-Tree

    if a:is_unicode == 'true'
        "let g:NERDTreeDirArrowExpandable = '▶'
        "let g:NERDTreeDirArrowCollapsible = '▼'
        let g:NERDTreeDirArrowExpandable = '+'
        let g:NERDTreeDirArrowCollapsible = '-'
    else
        let g:NERDTreeDirArrowExpandable = '+'
        let g:NERDTreeDirArrowCollapsible = '-'
    endif

    " Have NERDTree always open
    "autocmd VimEnter * NERDTree
    "autocmd BufEnter * NERDTreeMirror
    "autocmd BufWinEnter * NERDTreeMirror

    " Auto close vim if only the NERDTree remains
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " vim-minimap

endfunction
