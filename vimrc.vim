" Turn on hybrid line numbers
set number relativenumber

" Syntax highlighting
syntax on

" Allow 256 colors
" set t_Co=256

" Disable annoying command history
nnoremap q: <nop>
nnoremap Q <nop>

" map the paste mode to custom key
set pastetoggle=<F3>

" Set tab to size 4 and transform tabs into spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Find the folder containing the vimrc file
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Load the colours file
exec 'source' s:path . '/colours.vim'

" Load the status line file
exec 'source' s:path . '/statusline.vim'

" Load the tab line file
exec 'source' s:path . '/tabline.vim'

" Load the config file for plugins
exec 'source' s:path . '/plugins.vim'


