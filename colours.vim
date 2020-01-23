" My own list of custom colours for vim

" Mode colours
highlight UserColorInsert cterm=bold ctermfg=233 ctermbg=blue
highlight UserColorNormal cterm=bold ctermfg=233 ctermbg=green
highlight UserColorDelete cterm=bold ctermfg=233 ctermbg=red
highlight UserColorVisual cterm=bold ctermfg=233 ctermbg=cyan

" Mode colours arrow
highlight UserColorInsertArrow ctermfg=blue ctermbg=245
highlight UserColorNormalArrow ctermfg=green ctermbg=245
highlight UserColorDeleteArrow ctermfg=red ctermbg=245
highlight UserColorVisualArrow ctermfg=cyan ctermbg=245

" Status line colours
highlight UserColorLeftLeft cterm=bold ctermbg=245 ctermfg=233
highlight UserColorLeftMiddle cterm=None ctermbg=240 ctermfg=233
highlight UserColorLeftRight cterm=None ctermbg=235 ctermfg=240
highlight UserColorMiddle cterm=None ctermbg=233 ctermfg=240
highlight UserColorRightLeft cterm=None ctermbg=235 ctermfg=240
highlight UserColorRightMiddle cterm=None ctermbg=240 ctermfg=233
highlight UserColorRightRight cterm=None ctermbg=245 ctermfg=233

" Statis line colours arrow
highlight UserColorLeftLeftArrow ctermbg=240 ctermfg=245
highlight UserColorLeftMiddleArrow ctermbg=235 ctermfg=240
highlight UserColorLeftRightArrow ctermbg=233 ctermfg=235
highlight UserColorRightLeftArrow ctermbg=233 ctermfg=235
highlight UserColorRightMiddleArrow ctermbg=235 ctermfg=240
highlight UserColorRightRightArrow ctermbg=240 ctermfg=245

" ---------------- "
" Color Overwrites "
" ---------------- "

" Simple
highlight EndOfBuffer ctermfg=white
highlight LineNr ctermbg=233 ctermfg=white

" Syntax
highlight Statement ctermfg=yellow
highlight CursorLineNr cterm=None ctermfg=yellow

" Cursor Line
highlight CursorLine cterm=None ctermfg=233 ctermbg=250
