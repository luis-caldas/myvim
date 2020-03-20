" My own list of custom colours for vim

function! SetColours(colour_number)
    
    if a:colour_number == 256

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

        " Tab line colours
        highlight UserColorTabLine cterm=None ctermbg=235 ctermfg=240
        highlight UserColorTabLineSel cterm=None ctermbg=245 ctermfg=233
        highlight UserColorTabLineFill cterm=None ctermbg=233 ctermfg=245
        highlight UserColorTabLineNumber cterm=None ctermbg=240 ctermfg=233
        highlight UserColorTabLineSelNumber cterm=bold ctermbg=magenta ctermfg=233

        " Tab line arrow colours
        highlight UserColorTabLineNumberArrow cterm=None ctermbg=235 ctermfg=240
        highlight UserColorTabLineNumberArrowLeft cterm=None ctermbg=240 ctermfg=235
        highlight UserColorTabLineNumberArrowLeftSel cterm=None ctermbg=240 ctermfg=245
        highlight UserColorTabLineSelNumberArrow cterm=None ctermbg=245 ctermfg=magenta
        highlight UserColorTabLineSelNumberArrowLeft cterm=None ctermfg=235 ctermbg=magenta
        highlight UserColorTabLineArrow cterm=None ctermbg=235 ctermfg=245
        highlight UserColorTabLineEnd cterm=None ctermbg=233 ctermfg=235
        highlight UserColorTabLineEndSel cterm=None ctermbg=233 ctermfg=245

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

        " Simple
        highlight EndOfBuffer ctermfg=white
        highlight LineNr ctermbg=233 ctermfg=white

        " Status line continuation
        highlight StatusLine cterm=None ctermbg=234 ctermfg=white
        highlight StatusLineNC cterm=None ctermbg=234 ctermfg=None

        " Syntax
        highlight Statement ctermfg=white
        highlight CursorLineNr cterm=None ctermbg=white ctermfg=233

        " Cursor Line
        highlight CursorLine cterm=None ctermfg=250 ctermbg=234

        " Buffer divider
        highlight VertSplit cterm=None ctermbg=234 ctermfg=234

        " Color column limit
        highlight ColorColumn cterm=None ctermbg=234 ctermfg=234

    else

        " Mode colours
        highlight UserColorInsert cterm=None ctermfg=0 ctermbg=blue
        highlight UserColorNormal cterm=None ctermfg=0 ctermbg=green
        highlight UserColorDelete cterm=None ctermfg=0 ctermbg=red
        highlight UserColorVisual cterm=None ctermfg=0 ctermbg=cyan

        " Mode colours arrow
        highlight UserColorInsertArrow ctermfg=blue ctermbg=7
        highlight UserColorNormalArrow ctermfg=green ctermbg=7
        highlight UserColorDeleteArrow ctermfg=red ctermbg=7
        highlight UserColorVisualArrow ctermfg=cyan ctermbg=7

        " Tab line colours
        highlight UserColorTabLine cterm=None ctermbg=7 ctermfg=0
        highlight UserColorTabLineSel cterm=None ctermbg=7 ctermfg=0
        highlight UserColorTabLineFill cterm=None ctermbg=0 ctermfg=7
        highlight UserColorTabLineNumber cterm=None ctermbg=0 ctermfg=7
        highlight UserColorTabLineSelNumber cterm=None ctermbg=magenta ctermfg=0

        " Tab line arrow colours
        highlight UserColorTabLineNumberArrow cterm=None ctermbg=7 ctermfg=0
        highlight UserColorTabLineNumberArrowLeft cterm=None ctermbg=0 ctermfg=7
        highlight UserColorTabLineNumberArrowLeftSel cterm=None ctermbg=0 ctermfg=7
        highlight UserColorTabLineSelNumberArrow cterm=None ctermbg=7 ctermfg=magenta
        highlight UserColorTabLineSelNumberArrowLeft cterm=None ctermfg=7 ctermbg=magenta
        highlight UserColorTabLineArrow cterm=None ctermbg=0 ctermfg=7
        highlight UserColorTabLineEnd cterm=None ctermbg=0 ctermfg=7
        highlight UserColorTabLineEndSel cterm=None ctermbg=0 ctermfg=7

        " Status line colours
        highlight UserColorLeftLeft cterm=None ctermbg=7 ctermfg=0
        highlight UserColorLeftMiddle cterm=None ctermbg=0 ctermfg=7
        highlight UserColorLeftRight cterm=None ctermbg=7 ctermfg=0
        highlight UserColorMiddle cterm=None ctermbg=0 ctermfg=7
        highlight UserColorRightLeft cterm=None ctermbg=7 ctermfg=0
        highlight UserColorRightMiddle cterm=None ctermbg=0 ctermfg=7
        highlight UserColorRightRight cterm=None ctermbg=7 ctermfg=0

        " Status line colours arrows
        highlight UserColorLeftLeftArrow ctermbg=0 ctermfg=7
        highlight UserColorLeftMiddleArrow ctermbg=7 ctermfg=0
        highlight UserColorLeftRightArrow ctermbg=0 ctermfg=7
        highlight UserColorRightLeftArrow ctermbg=0 ctermfg=7
        highlight UserColorRightMiddleArrow ctermbg=7 ctermfg=0
        highlight UserColorRightRightArrow ctermbg=0 ctermfg=7
    
        " Simple
        highlight EndOfBuffer ctermfg=7
        highlight LineNr ctermbg=0 ctermfg=7

        " Status line continuation
        highlight StatusLine cterm=None ctermbg=7 ctermfg=0
        highlight StatusLineNC cterm=None ctermbg=7 ctermfg=None

        " Syntax
        highlight Statement ctermfg=7
        highlight CursorLineNr cterm=None ctermbg=7 ctermfg=0

        " Cursor Line
        highlight CursorLine cterm=None ctermfg=7 ctermbg=0

        " Buffer divider
        highlight VertSplit cterm=None ctermbg=7 ctermfg=7

        " Color column limit
        highlight ColorColumn cterm=None ctermbg=7 ctermfg=7
    
    endif

endfunction
