" Turn on hybrid line numbers
set number relativenumber

" Syntax highlighting
syntax on

" Disable the mouse cursor support
set mouse=

" Disable annoying command history
nnoremap q: <nop>
nnoremap Q <nop>

" Set the search highligh
set hlsearch

" Reset the colours
set termguicolors&

" map the paste mode to custom key
" set pastetoggle=<F3>

" Set tab to size 4 and transform tabs into spaces
" filetype plugin indent on
" set tabstop=4
" set shiftwidth=4
" set expandtab

" Add the color column limit
set colorcolumn=80

" Set folding
setlocal foldmethod=marker

" Automatically remove whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Change the path of the .viminfo file
set viminfo+='65535,n~/.cache/viminfo

" Use persistent history.
let s:undo_path = "/tmp/.vimundo"
if !isdirectory(s:undo_path)
    call mkdir(s:undo_path, "", 0700)
endif
exec "set undodir=" . s:undo_path
set undofile

" Remember last position
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

" Find the folder containing the vimrc file
let s:path = fnamemodify(resolve(expand("<sfile>:p")), ":h")

" Execute the vim-plug plugin manager
exec "source" s:path . "/plugins/plug.vim"

" Automatic download plugins
autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif

" Acquire the needed variables
let s:set_colours = $FORCE_COLOURS
let g:unicode_check = $APPLICATION_UNICODE == "true"

" Check if the colors variable is overidable
if s:set_colours == ""
    let s:set_colours = &t_Co
endif

" Load colours
exec "source" s:path . "/visual/noctu.vim"
exec "source" s:path . "/visual/colours.vim"
call SetColours(s:set_colours)

" Load the status and tab lines
exec "source" s:path . "/visual/lines/status.vim"
set statusline=%!StatusLine(g:unicode_check)
exec "source" s:path . "/visual/lines/tab.vim"
set tabline=%!TabLine(g:unicode_check)

" Load the listchars
set list
exec "source" s:path . "/visual/listchars.vim"
exec "set listchars=" . ListChars(g:unicode_check)
autocmd VimEnter,WinEnter * call ListCharsColours()

" Load the config file with the plugins configuration
exec "source" s:path . "/plugins/config.vim"
call ConfigurePlugins(g:unicode_check)

" Load the custom startup message
exec "source" s:path . "/visual/start.vim"
