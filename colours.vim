" My own list of custom colours for vim

" Mode colours
highlight UserColorInsert cterm=bold ctermfg=255 ctermbg=blue
highlight UserColorNormal cterm=bold ctermfg=255 ctermbg=green
highlight UserColorDelete cterm=bold ctermfg=255 ctermbg=red
highlight UserColorVisual cterm=bold ctermfg=255 ctermbg=cyan

" Colours for the status line
highlight UserColorWhiteBackground cterm=bold ctermbg=255 ctermfg=232
highlight UserColorGrayBackground cterm=bold ctermbg=245 ctermfg=232
highlight UserColorBar ctermbg=233 ctermfg=238

" ---------------- "
" Color Overwrites "
" ---------------- "

" Simple
highlight EndOfBuffer ctermfg=white
highlight LineNr ctermbg=233 ctermfg=white

" Syntax
highlight Statement ctermfg=yellow
highlight CursorLineNr cterm=underline ctermfg=yellow

