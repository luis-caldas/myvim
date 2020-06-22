" Sets the listchars depending on unicode
function! ListChars(is_unicode)

    " Create var for the list chars
    let s:list_chars = ""

    " Create default variables for each item
    let s:lc_tab   = ">>"
    let s:lc_space = "."
    let s:lc_trail = "-"
    let s:lc_nbsp  = "+"
    let s:lc_eol   = "~"

    " Overwrite wanted variables if unicode
    if a:is_unicode
        let s:lc_tab   = "░░"
        let s:lc_space = "·"
        let s:lc_nbsp  = "⣿"
        let s:lc_eol   = "¬"
    endif

    " Stitch all the variable together
    let s:list_chars .= "tab:"   . s:lc_tab   . ","
    let s:list_chars .= "space:" . s:lc_space . ","
    let s:list_chars .= "trail:" . s:lc_trail . ","
    let s:list_chars .= "nbsp:"  . s:lc_nbsp  . ","
    let s:list_chars .= "eol:"   . s:lc_eol

    " Return the full list of chars
    return s:list_chars

endfunction

" Function for matching colours
function! ListCharsColours()
    match UserColourLCharBase /\( \|\t\|\n\|\t\)/
endfunction
