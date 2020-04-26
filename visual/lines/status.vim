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
    let s:s_s = ""

    " Set unicode arrows to variables
    let s:left_arrow = ""
    let s:right_arrow = ""

    " List of modes to show on the line
    " 0 = mode char
    " 1 = prefix of the colour variable
    " 2 = the string that will be shown on the line
    let s:modes_allowed  = []
    let s:modes_allowed += [["n", "Normal", "  NORMAL "]]
    let s:modes_allowed += [["i", "Insert", "  INSERT "]]
    let s:modes_allowed += [["R", "Delete", "  REPLACE "]]
    let s:modes_allowed += [["v", "Visual", "  VISUAL "]]
    let s:modes_allowed += [["V", "Visual", "  LINE "]]
    " Fallback for other modes
    let s:fallback_mode = ["Other", "  OTHER "]

    " Create the expression that excludes all the ones before
    let s:modes_size = len(s:modes_allowed)
    let s:exclude_expression = ""
    for s:index_expr in range(s:modes_size)
        let s:exclude_expression .= "(mode()!='" . s:modes_allowed[s:index_expr][0] . "')"
        if s:index_expr + 1 < s:modes_size
            let s:exclude_expression .= "&&"
        end
    endfor

    " Iterate the mode list
    for s:each_mode in s:modes_allowed
        " Create the expression string 
        let s:expression_string = "mode()=='" . s:each_mode[0] . "'"
        " Add the backtick for powerlines
        if a:is_unicode
            let s:s_s .= Rs(s:v_p, s:each_mode[1] . "ArrowLeft")
            let s:s_s .= Ts(s:expression_string, s:left_arrow)
        endif
        " Add the mode information
        let s:s_s .= Rs(s:v_p, s:each_mode[1])
        let s:s_s .= Ts(s:expression_string, s:each_mode[2])
        " Add the arrow if supported by unicode
        if a:is_unicode
            let s:s_s .= Rs(s:v_p, s:each_mode[1] . "ArrowRight")
            let s:s_s .= Ts(s:expression_string, s:right_arrow)
        endif
    endfor

    " Create the biggest mode exclusion list
    " Add the backtick for powerlines
    if a:is_unicode
        let s:s_s .= Rs(s:v_p, s:fallback_mode[0]. "ArrowLeft")
        let s:s_s .= Ts(s:exclude_expression, s:left_arrow)
    endif
    " Add the mode information
    let s:s_s .= Rs(s:v_p, s:fallback_mode[0])
    let s:s_s .= Ts(s:exclude_expression, s:fallback_mode[1])
    " Add the arrow if supported by unicode
    if a:is_unicode
        let s:s_s .= Rs(s:v_p, s:fallback_mode[0] . "ArrowRight")
        let s:s_s .= Ts(s:exclude_expression, s:right_arrow)
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
