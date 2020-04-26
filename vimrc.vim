" Turn on hybrid line numbers
set number relativenumber

" Syntax highlighting
syntax on

" Disable annoying command history
nnoremap q: <nop>
nnoremap Q <nop>

" Set the search highligh
set hlsearch

" map the paste mode to custom key
set pastetoggle=<F3>

" Set tab to size 4 and transform tabs into spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Add the color column limit
set colorcolumn=80

" Change the path of the .viminfo file
set viminfo+='65535,n~/.cache/viminfo

" Find the folder containing the vimrc file
let s:path = fnamemodify(resolve(expand("<sfile>:p")), ":h")
let s:dot_path = s:path . "/dotvim"

" Acquire the needed variables
let s:set_colours = $FORCE_COLOURS
let g:unicode_check = $APPLICATION_UNICODE == "true"

" Check if the colors variable is overidable
if s:set_colours == ""
    let s:set_colours = &t_Co
endif

" Load the colours file
exec "source" s:path . "/visual/colours.vim"
call SetColours(s:set_colours)

" Load the status and tab lines
exec "source" s:path . "/visual/lines/status.vim"
set statusline=%!StatusLine(g:unicode_check)
exec "source" s:path . "/visual/lines/tab.vim"
set tabline=%!TabLine(g:unicode_check)

" Add the dotvim local folder
" set them "runtimepath" (without ~/.vim folders)
"let &runtimepath = printf("%s/vimfiles,%s,%s/vimfiles/after", $VIM, $VIMRUNTIME, $VIM)
"let &runtimepath = printf("%s,%s,%s/after", s:dot_path, &runtimepath, s:dot_path)

" Load the config file with the plugins configuration
exec "source" s:path . "/plugins.vim"
call ConfigurePlugins(g:unicode_check)

" Load the custom startup message
exec "source" s:path . "/visual/start.vim"
