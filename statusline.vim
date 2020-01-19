" Custom status line
set laststatus=2

" Start it empty
set statusline=

" --- Mode information
set statusline+=%#UserColorNormal#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#UserColorInsert#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#UserColorDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#UserColorVisual#%{(mode()=='v')?'\ \ VISUAL\ ':''}
" --- Arrow transition
set statusline+=%#UserColorNormalArrow#%{(mode()=='n')?'':''}
set statusline+=%#UserColorInsertArrow#%{(mode()=='i')?'':''}
set statusline+=%#UserColorDeleteArrow#%{(mode()=='r')?'':''}
set statusline+=%#UserColorVisualArrow#%{(mode()=='v')?'':''}

" --- Buffer numbering
set statusline+=%#UserColorLeftLeft#
set statusline+=\ %n\   
set statusline+=%#UserColorLeftLeftArrow#
set statusline+=
" --- File information
set statusline+=%#UserColorLeftMiddle#
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=\ %R%M\  
set statusline+=%#UserColorLeftMiddleArrow#
set statusline+=
" --- Rest of the bar  
set statusline+=%#UserColorLeftRight#
set statusline+=\ %F\  
set statusline+=%#UserColorLeftRightArrow#
set statusline+=
" --- Split it to the right side
set statusline+=%#UserColorMiddle#
set statusline+=%=
" ---
set statusline+=%#UserColorRightLeftArrow#
set statusline+=
set statusline+=%#UserColorRightLeft#
set statusline+=\ %Y\  
" --- Right side of status bar
set statusline+=%#UserColorRightMiddleArrow#
set statusline+=
set statusline+=%#UserColorRightMiddle#
set statusline+=\ %l:%c\  
" --- Final piece
set statusline+=%#UserColorRightRightArrow#
set statusline+=
set statusline+=%#UserColorRightRight#
set statusline+=\ %p\  
