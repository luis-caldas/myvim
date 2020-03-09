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

" Find the folder containing the vimrc file
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Acquire the needed variables
let s:set_colours = $FORCE_COLORS
let g:is_unicode = $APPLICATION_UNICODE

" Check if the colors variable is overidable
if s:set_colours == ''
    let s:set_colours = &t_Co
endif

" Load the colours file
exec 'source' s:path . '/colours.vim'
call SetColours(s:set_colours)

" Load the status and tab lines
exec 'source' s:path . '/lines/status.vim'
set statusline=%!StatusLine(g:is_unicode)
exec 'source' s:path . '/lines/tab.vim'
set tabline=%!TabLine(g:is_unicode)

" Load the config file with the plugins configurations and imports
exec 'source' s:path . '/plugins.vim'


