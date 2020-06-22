" Always show the tabline
set showtabline=2

" Function that generates a variable replacement string
function! Rs(prefix, name)
    return "%#" . a:prefix . a:name . "#"
endfunction

" Create the custom tab line
function! TabLine(is_unicode)

    " Colour variable name prefix
    let s:v_p = "UserColourTab"

    " Init the tabline string
    let s:t_s = ""
    
    " Set unicode arrows to variables
    let s:left_arrow = ""
    let s:right_arrow = ""

    " Acquire the number of tabs
    let s:nr_tabs = tabpagenr("$")

    " Iterate the tabs
    for i in range(s:nr_tabs)

        " The tab in the iteration
        let s:tab_number = i + 1

        " The tab selected
        let s:sel_tab = tabpagenr()

        " Extract some useful data
        let s:winnr = tabpagewinnr(s:tab_number)
        let s:buflist = tabpagebuflist(s:tab_number)
        let s:bufnr = s:buflist[s:winnr - 1]
        let s:bufname = bufname(s:bufnr)
        let s:bufmodified = getbufvar(s:bufnr, "&mod")

        " Data that will be shown inside a block
        let s:data_left = " " . s:tab_number . " "
        let s:data_right =  " " . (s:bufname != "" ? fnamemodify(s:bufname, ":t") : "[No Name]") . " "

        " Add the leftmost arrow in a block
        if a:is_unicode
            " Check if we are at the first iteration
            if i == 0
                if s:tab_number == s:sel_tab
                    let s:t_s .= Rs(s:v_p, "FirstSelArrow")
                else
                    let s:t_s .= Rs(s:v_p, "FirstArrow")
                endif
                let s:t_s .= s:left_arrow
            else
                " Add the appropriate color
                if s:tab_number == s:sel_tab
                    let s:t_s .= Rs(s:v_p, "FirstInvertedSelArrow")
                else
                    " Check if last tab was the selected one
                    if s:tab_number - 1 == s:sel_tab
                        let s:t_s .= Rs(s:v_p, "FirstBeforeSelArrow")
                    else
                        let s:t_s .= Rs(s:v_p, "FirstInvertedArrow")
                    endif
                endif
                let s:t_s .= s:right_arrow
            endif
        endif

        " The inside part of the block
        let s:t_s .= (s:tab_number == s:sel_tab ? Rs(s:v_p, "NumberSel") : Rs(s:v_p, "Number"))
        let s:t_s .= s:data_left 
        if a:is_unicode
            let s:t_s .= (s:tab_number == s:sel_tab ? Rs(s:v_p, "MiddleSelArrow") : Rs(s:v_p, "MiddleArrow"))
            let s:t_s .= s:right_arrow
        endif
        let s:t_s .= (s:tab_number == s:sel_tab ? Rs(s:v_p, "LineSel") : Rs(s:v_p, "Line"))
        let s:t_s .= s:data_right
        
        " Show on the block if the file has been modified
        if s:bufmodified
            let s:t_s .= "+ "
        endif

        " Add the last arrow on the block
        if a:is_unicode
            " Check if we reached the end of the bar
            if s:tab_number == s:nr_tabs
                " Select the arrow color depending if we are selected
                if s:tab_number == s:sel_tab
                    let s:t_s .= Rs(s:v_p, "EndSelArrow")
                else
                    let s:t_s .= Rs(s:v_p, "EndArrow")
                endif
                " Add the arrow
                let s:t_s .= s:right_arrow
            endif
        endif

    endfor

    " Fill the rest of the bar with the given colour
    let s:t_s .= Rs(s:v_p, "End")

    return s:t_s

endfunction
