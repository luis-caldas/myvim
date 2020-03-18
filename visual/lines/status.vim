" Custom status line
set laststatus=2

" Create the custom status line
function! StatusLine(is_unicode)
    
    " Start the status line empty
    let status_string = ''

    " Check if this program uses unicode arrows
    if a:is_unicode == 'true'
    " Set unicode arrows to variables
        let left_arrow = ''
        let right_arrow = ''
    else
        let left_arrow = ''
        let right_arrow = ''
    endif

    " Add the mode information
    let status_string .= "%#UserColorNormal#%{(mode()=='n')?'\ \ NORMAL\ ':''}"
    let status_string .= "%#UserColorInsert#%{(mode()=='i')?'\ \ INSERT\ ':''}"
    let status_string .= "%#UserColorDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}"
    let status_string .= "%#UserColorVisual#%{(mode()=='v')?'\ \ VISUAL\ ':''}"

    " Add the arrow if supported by unicode
    if a:is_unicode == 'true'
        let status_string .= "%#UserColorNormalArrow#%{(mode()=='n')?'" . right_arrow . "':''}"
        let status_string .= "%#UserColorInsertArrow#%{(mode()=='i')?'" . right_arrow . "':''}"
        let status_string .= "%#UserColorDeleteArrow#%{(mode()=='r')?'" . right_arrow . "':''}"
        let status_string .= "%#UserColorVisualArrow#%{(mode()=='v')?'" . right_arrow . "':''}"
    endif

    " Show the buffer number
    let status_string .= '%#UserColorLeftLeft#'
    let status_string .= ' %n ' 
    let status_string .= '%#UserColorLeftLeftArrow#'
    let status_string .= right_arrow

    " Add the file information
    let status_string .= '%#UserColorLeftMiddle#'
    let status_string .= "%{&paste?'\ PASTE':''}"
    let status_string .= "%{&spell?'\ SPELL':''}"
    let status_string .= ' [%R%M] '
    let status_string .= '%#UserColorLeftMiddleArrow#'
    let status_string .= right_arrow

    " --- Rest of the bar  
    let status_string .= '%#UserColorLeftRight#'
    let status_string .= ' %F '
    let status_string .= '%#UserColorLeftRightArrow#'
    let status_string .= right_arrow

    " Middle of the Bar
    let status_string .= '%#UserColorMiddle#'
    let status_string .= '%='
    " ---

    " Show the filetype and encoding
    let status_string .= '%#UserColorRightLeftArrow#'
    let status_string .= left_arrow
    let status_string .= '%#UserColorRightLeft#'
    let status_string .= ' [%{&encoding},%{&fileencoding},%{&fileformat},%Y] '

    " Show the line and col the cursor is in
    let status_string .= '%#UserColorRightMiddleArrow#'
    let status_string .= left_arrow
    let status_string .= '%#UserColorRightMiddle#'
    let status_string .= ' %l:%c '

    " Show the percentage of the file in which the cursor is in
    let status_string .= '%#UserColorRightRightArrow#'
    let status_string .= left_arrow
    let status_string .= '%#UserColorRightRight#'
    let status_string .= ' %p%% '

   " Return the full string
   return status_string 

endfunction
