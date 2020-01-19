" Turn on hybrid line numbers
set number relativenumber

" Syntax highlighting
syntax on

" Allow 256 colors
set t_Co=256

" Disable annoying command history
nnoremap q: <nop>
nnoremap Q <nop>

" Find the folder containing the vimrc file
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Load the colours file
exec 'source' s:path . "/colours.vim"

" Custom status line
set laststatus=2
" --- Mode information
set statusline=%#UserColorNormal#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#UserColorInsert#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#UserColorDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#UserColorVisual#%{(mode()=='v')?'\ \ VISUAL\ ':''}
" --- Buffer numbering
set statusline+=%#UserColorWhiteBackground#
set statusline+=\ %n\  
" --- File information
set statusline+=%#UserColorGrayBackround#
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=\ %R%M\
" --- Rest of the bar  
set statusline+=%#UserColorBar#
set statusline+=\ %F\  
set statusline+=%=
set statusline+=%#UserColorGrayBackground#
set statusline+=\ %Y\  
" --- Right side of status bar
set statusline+=%#UserColorWhiteBackground#
set statusline+=\ %l:%c
set statusline+=\ %p\  

