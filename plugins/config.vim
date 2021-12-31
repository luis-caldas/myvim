" Starting the plugins

" Set plugin manager folder
call plug#begin(stdpath('data') . "/mine-plugins")

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'LnL7/vim-nix'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'neovimhaskell/haskell-vim'
Plug 'farmergreg/vim-lastplace'
Plug 'prabirshrestha/vim-lsp'
"Plug 'severin-lemaignan/vim-minimap'

call plug#end()

" Function to configure plugins
function! ConfigurePlugins(is_unicode)

    " NERD-Tree

    if a:is_unicode == "true"
        "let g:NERDTreeDirArrowExpandable = "▶"
        "let g:NERDTreeDirArrowCollapsible = "▼"
        let g:NERDTreeDirArrowExpandable = "+"
        let g:NERDTreeDirArrowCollapsible = "-"
    else
        let g:NERDTreeDirArrowExpandable = "+"
        let g:NERDTreeDirArrowCollapsible = "-"
    endif

    " Have NERDTree always open
    "autocmd VimEnter * NERDTree
    "autocmd BufEnter * NERDTreeMirror
    "autocmd BufWinEnter * NERDTreeMirror

    " Auto close vim if only the NERDTree remains
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " Haskell
    let g:haskell_indent_disable = 1

    " gitgutter
    let g:gitgutter_terminal_reports_focus = 0

    " vim-minimap

endfunction
