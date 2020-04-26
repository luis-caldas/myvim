" My own list of custom colours for vim

" The highlight with variables executor
function! Eh(prefix, var_name, c, fg, bg)

    " Create the custom highlight command
    let s:exec =  "highlight" . " " . a:prefix . a:var_name
    let s:exec .= " " . "cterm=" . (a:c ? "bold" : "none")
    let s:exec .= " " . "ctermfg=" . a:fg
    let s:exec .= " " . "ctermbg=" . a:bg

    " Execute the created command
    execute s:exec

endfunction

" Geral set colours function
function! SetColours(colour_number)

    " Set the prefix string of the highlight variable 
    let s:c_p = "UserColour"
    let s:c_p_s = s:c_p . "Status"
    let s:c_p_t = s:c_p . "Tab"

    " Setting some helpful colour vars
    let s:normal = "blue"
    let s:insert = "green"
    let s:delete = "red"
    let s:visual = "cyan"
    let s:other  = "yellow"
    let s:htab   = "magenta"

    " Colour renaming
    let s:c_none = "none"
    let s:c_white = 7
    let s:c_black = 0
    let s:c_grey_1 = 233
    let s:c_grey_2 = 235
    let s:c_grey_3 = 238
    let s:c_grey_4 = 240
    let s:c_grey_5 = 243
    let s:c_grey_6 = 245
    let s:c_grey_7 = 250

    " Check how many colours the user has
    if a:colour_number == 256

        " Assigning names for the status line
        " l = left
        " m = middle
        " r = right
        " s = status
        " bg = background
        " fg = foreground
        let s:s_line_l_bg = s:c_none
        let s:s_line_m_bg = s:c_none
        let s:s_line_m_fg = s:c_none
        let s:s_line_r_bg = s:c_none
        let s:s_line_l_fg = s:c_grey_1
        let s:s_line_l_l_bg = s:c_grey_7
        let s:s_line_l_l_fg = s:c_grey_1
        let s:s_line_l_m_bg = s:c_grey_6
        let s:s_line_l_m_fg = s:c_grey_1
        let s:s_line_l_r_bg = s:c_grey_2
        let s:s_line_l_r_fg = s:c_grey_7
        " Naming boldness in order of appearance
        let s:s_bold_l = 1
        let s:s_bold_l_l = 0
        let s:s_bold_l_m = 0
        let s:s_bold_l_r = 0
        let s:s_bold_m = 0
        " The right part is a mirror of the left part
        let s:s_line_r_l_bg = s:s_line_l_r_bg
        let s:s_line_r_l_fg = s:s_line_l_r_fg
        let s:s_line_r_m_bg = s:s_line_l_m_bg
        let s:s_line_r_m_fg = s:s_line_l_m_fg
        let s:s_line_r_r_bg = s:s_line_l_l_bg
        let s:s_line_r_r_fg = s:s_line_l_l_fg
        " Borders are a mirror as well
        let s:s_bold_r_r = s:s_bold_l_l
        let s:s_bold_r_m = s:s_bold_l_m
        let s:s_bold_r_l = s:s_bold_l_r

        " Assigning names for the tab line
        " t = tab
        " n = not selected
        " s = selected
        let s:t_block_l_s_bg = s:htab
        let s:t_block_l_s_fg = s:s_line_l_fg
        let s:t_block_r_s_bg = s:s_line_l_l_bg
        let s:t_block_r_s_fg = s:s_line_l_l_fg
        let s:t_block_l_n_bg = s:s_line_l_m_bg
        let s:t_block_l_n_fg = s:s_line_l_m_fg
        let s:t_block_r_n_bg = s:s_line_l_r_bg
        let s:t_block_r_n_fg = s:s_line_l_r_fg
        " Left space
        let s:t_block_l_bg = s:c_none
        " The right part of the blocks
        let s:t_block_r_bg = s:c_none
        let s:t_block_r_fg = s:c_none
        " Bolding of the block
        let s:t_bold_l_s = s:s_bold_l
        let s:t_bold_r_s = s:s_bold_l_l
        let s:t_bold_l_n = s:s_bold_l_m
        let s:t_bold_r_n = s:s_bold_l_r
        let s:t_bold_r = s:c_none

        " Reasigning the default colours of vim
        " r = reasign
        let s:c_dark_accent    = s:c_grey_1
        let s:r_end_of_buffer  = [ s:c_none, s:c_none       , s:c_white]
        let s:r_line_nr        = [ s:c_none, s:c_dark_accent, s:c_white]
        let s:r_status_line    = [ s:c_none, s:c_dark_accent, s:c_white]
        let s:r_status_line_nc = [ s:c_none, s:c_dark_accent, s:c_none ]
        let s:r_statement      = [ s:c_none, s:c_none       , s:c_white]
        let s:r_cursor_line_nr = [ s:c_none, s:c_white, s:c_dark_accent]
        let s:r_cursor_line    = [ s:c_none, s:c_white, s:c_dark_accent]
        let s:r_vert_split     = [ s:c_none, s:c_dark_accent, s:c_dark_accent]
        let s:r_color_column   = [ s:c_none, s:c_dark_accent, s:c_none]

    else

        " Assigning name for the status line
        let s:s_line_l_bg = s:c_none
        let s:s_line_m_bg = s:c_none
        let s:s_line_m_fg = s:c_none
        let s:s_line_r_bg = s:c_none
        let s:s_line_l_fg = s:c_black
        let s:s_line_l_l_bg = s:c_white
        let s:s_line_l_l_fg = s:c_black
        let s:s_line_l_m_bg = s:c_black
        let s:s_line_l_m_fg = s:c_white
        let s:s_line_l_r_bg = s:c_white
        let s:s_line_l_r_fg = s:c_black
        " Naming boldness in order of appearance
        let s:s_bold_l = 0
        let s:s_bold_l_l = 0
        let s:s_bold_l_m = 0
        let s:s_bold_l_r = 0
        let s:s_bold_m = 0
        " The right part is a mirror of the left part
        let s:s_line_r_l_bg = s:s_line_l_r_bg
        let s:s_line_r_l_fg = s:s_line_l_r_fg
        let s:s_line_r_m_bg = s:s_line_l_m_bg
        let s:s_line_r_m_fg = s:s_line_l_m_fg
        let s:s_line_r_r_bg = s:s_line_l_l_bg
        let s:s_line_r_r_fg = s:s_line_l_l_fg
        " Borders are a mirror as well
        let s:s_bold_r_r = s:s_bold_l_l
        let s:s_bold_r_m = s:s_bold_l_m
        let s:s_bold_r_l = s:s_bold_l_r

        " Assigning names for the tab line
        let s:t_block_l_s_bg = s:htab
        let s:t_block_l_s_fg = s:s_line_l_fg
        let s:t_block_r_s_bg = s:s_line_l_l_bg
        let s:t_block_r_s_fg = s:s_line_l_l_fg
        let s:t_block_l_n_bg = s:s_line_l_m_bg
        let s:t_block_l_n_fg = s:s_line_l_m_fg
        let s:t_block_r_n_bg = s:s_line_l_r_bg
        let s:t_block_r_n_fg = s:s_line_l_r_fg
        " Left space
        let s:t_block_l_bg = s:c_none
        " The right part of the blocks
        let s:t_block_r_bg = s:c_none
        let s:t_block_r_fg = s:c_none
        " Bolding of the block
        let s:t_bold_l_s = s:s_bold_l
        let s:t_bold_r_s = s:s_bold_l_l
        let s:t_bold_l_n = s:s_bold_l_m
        let s:t_bold_r_n = s:s_bold_l_r
        let s:t_bold_r = s:c_none

        " Colours reassign
        let s:c_dark_accent    = s:c_black
        let s:r_end_of_buffer  = [ s:c_none, s:c_none       , s:c_white]
        let s:r_line_nr        = [ s:c_none, s:c_dark_accent, s:c_white]
        let s:r_status_line    = [ s:c_none, s:c_white, s:c_dark_accent]
        let s:r_status_line_nc = [ s:c_none, s:c_white      , s:c_none ]
        let s:r_statement      = [ s:c_none, s:c_none       , s:c_white]
        let s:r_cursor_line_nr = [ s:c_none, s:c_white, s:c_dark_accent]
        let s:r_cursor_line    = [ s:c_none, s:c_white, s:c_dark_accent]
        let s:r_vert_split     = [ s:c_none, s:c_white      , s:c_white]
        let s:r_color_column   = [ s:c_none, s:c_white      , s:c_none ]
    
    endif

    " Status bar colours
    " Start of the creation of the colours
    call Eh(s:c_p_s, "Normal", s:s_bold_l, s:s_line_l_fg, s:normal)
    call Eh(s:c_p_s, "Insert", s:s_bold_l, s:s_line_l_fg, s:insert)
    call Eh(s:c_p_s, "Visual", s:s_bold_l, s:s_line_l_fg, s:visual)
    call Eh(s:c_p_s, "Delete", s:s_bold_l, s:s_line_l_fg, s:delete)
    call Eh(s:c_p_s, "Other" , s:s_bold_l, s:s_line_l_fg, s:other)
    " Varibles for the arrows that envelops the item
    call Eh(s:c_p_s, "NormalArrowLeft" , 0, s:normal, s:s_line_l_bg)
    call Eh(s:c_p_s, "InsertArrowLeft" , 0, s:insert, s:s_line_l_bg)
    call Eh(s:c_p_s, "VisualArrowLeft" , 0, s:visual, s:s_line_l_bg)
    call Eh(s:c_p_s, "DeleteArrowLeft" , 0, s:delete, s:s_line_l_bg)
    call Eh(s:c_p_s, "OtherArrowLeft"  , 0, s:other , s:s_line_l_bg)
    call Eh(s:c_p_s, "NormalArrowRight", 0, s:normal, s:s_line_l_l_bg)
    call Eh(s:c_p_s, "InsertArrowRight", 0, s:insert, s:s_line_l_l_bg)
    call Eh(s:c_p_s, "VisualArrowRight", 0, s:visual, s:s_line_l_l_bg)
    call Eh(s:c_p_s, "DeleteArrowRight", 0, s:delete, s:s_line_l_l_bg)
    call Eh(s:c_p_s, "OtherArrowRight" , 0, s:other , s:s_line_l_l_bg)
    " Create the colours for the blocks on the status line
    call Eh(s:c_p_s, "LeftLeft"   , s:s_bold_l_l, s:s_line_l_l_fg, s:s_line_l_l_bg)
    call Eh(s:c_p_s, "LeftMiddle" , s:s_bold_l_m, s:s_line_l_m_fg, s:s_line_l_m_bg)
    call Eh(s:c_p_s, "LeftRight"  , s:s_bold_l_r, s:s_line_l_r_fg, s:s_line_l_r_bg)
    call Eh(s:c_p_s, "RightLeft"  , s:s_bold_r_l, s:s_line_r_l_fg, s:s_line_r_l_bg)
    call Eh(s:c_p_s, "RightMiddle", s:s_bold_r_m, s:s_line_r_m_fg, s:s_line_r_m_bg)
    call Eh(s:c_p_s, "RightRight" , s:s_bold_r_r, s:s_line_r_r_fg, s:s_line_r_r_bg)
    " The blocks arrows
    call Eh(s:c_p_s, "LeftLeftArrow"   , 0, s:s_line_l_l_bg, s:s_line_l_m_bg)
    call Eh(s:c_p_s, "LeftMiddleArrow" , 0, s:s_line_l_m_bg, s:s_line_l_r_bg)
    call Eh(s:c_p_s, "LeftRightArrow"  , 0, s:s_line_l_r_bg, s:s_line_m_bg)
    call Eh(s:c_p_s, "RightLeftArrow"  , 0, s:s_line_r_l_bg, s:s_line_m_bg)
    call Eh(s:c_p_s, "RightMiddleArrow", 0, s:s_line_r_m_bg, s:s_line_r_l_bg)
    call Eh(s:c_p_s, "RightRightArrow" , 0, s:s_line_r_r_bg, s:s_line_r_m_bg)
    " Extremities Arrows
    call Eh(s:c_p_s, "LeftArrow" , 0, s:s_line_r_r_bg, s:s_line_r_bg)
    call Eh(s:c_p_s, "RightArrow", 0, s:s_line_r_r_bg, s:s_line_r_bg)
    " Colour for the middle of the bar
    call Eh(s:c_p_s, "Middle", s:s_bold_m, s:s_line_m_fg, s:s_line_m_bg)

    " Tab bar colours
    " Colour of the blocks
    call Eh(s:c_p_t, "Number"   , s:t_bold_l_n, s:t_block_l_n_fg, s:t_block_l_n_bg)
    call Eh(s:c_p_t, "Line"     , s:t_bold_r_n, s:t_block_r_n_fg, s:t_block_r_n_bg)
    call Eh(s:c_p_t, "NumberSel", s:t_bold_l_s, s:t_block_l_s_fg, s:t_block_l_s_bg)
    call Eh(s:c_p_t, "LineSel"  , s:t_bold_r_s, s:t_block_r_s_fg, s:t_block_r_s_bg)
    " Colour of the arrows
    call Eh(s:c_p_t, "FirstArrow"           , 0, s:t_block_l_n_bg, s:t_block_l_bg)
    call Eh(s:c_p_t, "FirstSelArrow"        , 0, s:t_block_l_s_bg, s:t_block_l_bg)
    call Eh(s:c_p_t, "FirstBeforeSelArrow"  , 0, s:t_block_r_s_bg, s:t_block_l_n_bg)
    call Eh(s:c_p_t, "FirstInvertedArrow"   , 0, s:t_block_r_n_bg, s:t_block_l_n_bg)
    call Eh(s:c_p_t, "FirstInvertedSelArrow", 0, s:t_block_r_n_bg, s:t_block_l_s_bg)
    call Eh(s:c_p_t, "MiddleArrow"          , 0, s:t_block_l_n_bg, s:t_block_r_n_bg)
    call Eh(s:c_p_t, "MiddleSelArrow"       , 0, s:t_block_l_s_bg, s:t_block_r_s_bg)
    call Eh(s:c_p_t, "EndArrow"             , 0, s:t_block_r_n_bg, s:t_block_r_bg)
    call Eh(s:c_p_t, "EndSelArrow"          , 0, s:t_block_r_s_bg, s:t_block_r_bg)
    " Colour for the end of the bar
    call Eh(s:c_p_t, "End", s:t_bold_r, s:t_block_r_fg, s:t_block_r_bg)

    " Colour reasignment
    call Eh("", "EndOfBuffer" , s:r_end_of_buffer[0] , s:r_end_of_buffer[2] , s:r_end_of_buffer[1])
    call Eh("", "LineNr"      , s:r_line_nr[0]       , s:r_line_nr[2]       , s:r_line_nr[1])
    call Eh("", "StatusLine"  , s:r_status_line[0]   , s:r_status_line[2]   , s:r_status_line[1])
    call Eh("", "StatusLineNc", s:r_status_line_nc[0], s:r_status_line_nc[2], s:r_status_line_nc[1])
    call Eh("", "Statement"   , s:r_statement[0]     , s:r_statement[2]     , s:r_statement[1])
    call Eh("", "CursorLineNr", s:r_cursor_line_nr[0], s:r_cursor_line_nr[2], s:r_cursor_line_nr[1])
    call Eh("", "CursorLine"  , s:r_cursor_line[0]   , s:r_cursor_line[2]   , s:r_cursor_line[1])
    call Eh("", "VertSplit"   , s:r_vert_split[0]    , s:r_vert_split[2]    , s:r_vert_split[1])
    call Eh("", "ColorColumn" , s:r_color_column[0]  , s:r_color_column[2]  , s:r_color_column[1])

endfunction
