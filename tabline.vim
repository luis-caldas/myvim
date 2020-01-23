" Always show the tabline

set showtabline=2

" Create the custom tab line
function! Tabline()

    " Init the tabline string
    let tab_string = ''
    
    " Set unicode arrows to variables
    let left_arrow = ''
    let right_arrow = ''

    " Acquire the number of tabs
    let nr_tabs = tabpagenr('$')

    " Iterate the tabs
    for i in range(nr_tabs)

        " The tab in the iteration
        let tab_number = i + 1

        " The tab selected
        let sel_tab = tabpagenr()

        let winnr = tabpagewinnr(tab_number)
        
        let buflist = tabpagebuflist(tab_number)
        let bufnr = buflist[winnr - 1]

        let bufname = bufname(bufnr)
        let bufmodified = getbufvar(bufnr, "&mod")

        " let tab_string .= '%#UserColorTabLineNumber#' . '%' . tab_number . 'T'
        " let tab_string .= '%#UserColorTabLineNumberArrow#' . right_arrow

        " Check if we are at the first iteration
        if i != 0

            " Add the appropriate color
            if tab_number == sel_tab
                let tab_string .= '%#UserColorTabLineSelNumberArrowLeft#'
            else

                " Check if last tab was the selected one
                if tab_number - 1 == sel_tab
                    let tab_string .= '%#UserColorTabLineNumberArrowLeftSel#'
                else
                    let tab_string .= '%#UserColorTabLineNumberArrowLeft#'
                endif
            endif

            let tab_string .= right_arrow

        endif

        let tab_string .= (tab_number == sel_tab ? '%#UserColorTabLineSelNumber#' : '%#UserColorTabLineNumber#')
        let tab_string .= ' ' . tab_number . ' '
        let tab_string .= (tab_number == sel_tab ? '%#UserColorTabLineSelNumberArrow#' : '%#UserColorTabLineNumberArrow#')
        let tab_string .= right_arrow
        let tab_string .= (tab_number == sel_tab ? '%#UserColorTabLineSel#' : '%#UserColorTabLine#')
        let tab_string .= ' ' . (bufname != '' ? fnamemodify(bufname, ':t') : '[No Name]') . ' '

        if bufmodified
            let tab_string .= '+ '
        endif

        " Check if we reached the end of the bar
        if tab_number == nr_tabs

            " Select the arrow color depending if we are selected
            if tab_number == sel_tab
                let tab_string .= '%#UserColorTabLineEndSel#'
            else
                let tab_string .= '%#UserColorTabLineEnd#'
            endif

            " Add the arrow
            let tab_string .= right_arrow

        endif

    endfor

    let tab_string .= '%#UserColorTabLineFill#'

    return tab_string

endfunction

" Set the line
set tabline=%!Tabline()
