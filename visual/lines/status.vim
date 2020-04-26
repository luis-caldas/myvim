" Custom status line
set laststatus=2

" Function that generates a variable replacement string
function! Rs(prefix, name)
    return "%#" . a:prefix . a:name . "#"
endfunction

" Function that creates a ternary string
function! Ts(expression, value_if_true)
    return "%{(" . a:expression. ") ? '" . a:value_if_true . "' : ''}"
endfunction

" Create the custom status line
function! StatusLine(is_unicode)

    " Variable generation prefix
    let s:v_p = "UserColourStatus"

    " What is shown on the blocks in order of appearance
    let s:block_l_l = " %n " 
    let s:block_l_m = Ts("&paste", " PASTE") . Ts("&spell", " SPELL") . " [%R%M] "
    let s:block_l_r = " %F "
    let s:block_m   = "%="
    let s:block_r_l = " [%{&encoding},%{&fileencoding},%{&fileformat},%Y] "
    let s:block_r_m = " %l:%c "
    let s:block_r_r = " %p%% "

    " Start the status line empty
    let s:s_s = ''

    " Set unicode arrows to variables
    let s:left_arrow = ''
    let s:right_arrow = ''

    " Add the backtick for powerlines
    if a:is_unicode
        let s:s_s .= Rs(s:v_p, "NormalArrowLeft") . Ts("mode()=='n'", s:left_arrow)
        let s:s_s .= Rs(s:v_p, "InsertArrowLeft") . Ts("mode()=='i'", s:left_arrow)
        let s:s_s .= Rs(s:v_p, "DeleteArrowLeft") . Ts("mode()=='r'", s:left_arrow)
        let s:s_s .= Rs(s:v_p, "VisualArrowLeft") . Ts("mode()=='v'", s:left_arrow)
    endif

    " Add the mode information
    let s:s_s .= Rs(s:v_p, "Normal") . Ts("mode()=='n'", "  NORMAL ")
    let s:s_s .= Rs(s:v_p, "Insert") . Ts("mode()=='i'", "  INSERT ")
    let s:s_s .= Rs(s:v_p, "Delete") . Ts("mode()=='r'", "  DELETE ")
    let s:s_s .= Rs(s:v_p, "Visual") . Ts("mode()=='v'", "  VISUAL ")

    " Add the arrow if supported by unicode
    if a:is_unicode
        let s:s_s .= Rs(s:v_p, "NormalArrowRight") . Ts("mode()=='n'", s:right_arrow)
        let s:s_s .= Rs(s:v_p, "InsertArrowRight") . Ts("mode()=='i'", s:right_arrow)
        let s:s_s .= Rs(s:v_p, "DeleteArrowRight") . Ts("mode()=='r'", s:right_arrow)
        let s:s_s .= Rs(s:v_p, "VisualArrowRight") . Ts("mode()=='v'", s:right_arrow)
    endif

    " Left most part of the Bar
    let s:s_s .= Rs(s:v_p, "LeftLeft")
    let s:s_s .= s:block_l_l
    if a:is_unicode
        let s:s_s .= Rs(s:v_p, "LeftLeftArrow")
        let s:s_s .= s:right_arrow
    endif
    let s:s_s .= Rs(s:v_p, "LeftMiddle")
    let s:s_s .= s:block_l_m
    if a:is_unicode
        let s:s_s .= Rs(s:v_p, "LeftMiddleArrow")
        let s:s_s .= s:right_arrow
    endif
    let s:s_s .= Rs(s:v_p, "LeftRight")
    let s:s_s .= s:block_l_r
    if a:is_unicode
        let s:s_s .= Rs(s:v_p, "LeftRightArrow")
        let s:s_s .= s:right_arrow
    endif

    " Middle of the Bar
    let s:s_s .= Rs(s:v_p, "Middle")
    let s:s_s .= s:block_m

    " Rightmost part of the bar
    if a:is_unicode
        let s:s_s .= Rs(s:v_p, "RightLeftArrow")
        let s:s_s .= s:left_arrow
    endif
    let s:s_s .= Rs(s:v_p, "RightLeft")
    let s:s_s .= s:block_r_l
    if a:is_unicode
        let s:s_s .= Rs(s:v_p, "RightMiddleArrow")
        let s:s_s .= s:left_arrow
    endif
    let s:s_s .= Rs(s:v_p, "RightMiddle")
    let s:s_s .= s:block_r_m
    if a:is_unicode
        let s:s_s .= Rs(s:v_p, "RightRightArrow")
        let s:s_s .= s:left_arrow
    endif
    let s:s_s .= Rs(s:v_p, "RightRight")
    let s:s_s .= s:block_r_r
    if a:is_unicode
        let s:s_s .= Rs(s:v_p, "RightArrow")
        let s:s_s .= s:right_arrow
    endif

   " Return the full string
   return s:s_s 

endfunction
