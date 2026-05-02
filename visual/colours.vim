" Highlight groups

function! s:Hi(group, attrs, fg, bg) abort
    let l:attrs = empty(a:attrs) ? 'NONE' : a:attrs
    let l:fg = empty(a:fg) ? 'NONE' : a:fg
    let l:bg = empty(a:bg) ? 'NONE' : a:bg

    execute 'highlight' a:group
        \ . ' cterm=' . l:attrs
        \ . ' ctermfg=' . l:fg
        \ . ' ctermbg=' . l:bg
        \ . ' gui=' . l:attrs
        \ . ' guifg=' . l:fg
        \ . ' guibg=' . l:bg
endfunction

function! SetColours() abort
    call s:Hi('Normal',       'NONE',           'NONE',    'NONE')
    call s:Hi('StatusLine',   'NONE',           'NONE',    'NONE')
    call s:Hi('StatusLineNC', 'NONE',           'NONE',    'NONE')
    call s:Hi('TabLine',      'NONE',           'NONE',    'NONE')
    call s:Hi('TabLineSel',   'bold',           'NONE',    'NONE')
    call s:Hi('TabLineFill',  'NONE',           'NONE',    'NONE')
    call s:Hi('LineNr',       'NONE',           'NONE',    'NONE')
    call s:Hi('CursorLineNr', 'bold',           'Blue',    'NONE')
    call s:Hi('CursorLine',   'NONE',           'NONE',    'NONE')
    call s:Hi('ColorColumn',  'NONE',           'NONE',    'NONE')
    call s:Hi('VertSplit',    'NONE',           'NONE',    'NONE')
    call s:Hi('EndOfBuffer',  'NONE',           'NONE',    'NONE')
    call s:Hi('SignColumn',   'NONE',           'NONE',    'NONE')

    if hlexists('WinSeparator')
        call s:Hi('WinSeparator', 'NONE',       'NONE',    'NONE')
    endif

    call s:Hi('Search',       'underline',      'NONE',    'NONE')
    call s:Hi('IncSearch',    'bold,underline', 'NONE',    'NONE')
    call s:Hi('Visual',       'reverse',        'NONE',    'NONE')
    call s:Hi('WildMenu',     'reverse',        'NONE',    'NONE')

    call s:Hi('UserColourLCharBase',       'NONE', 'NONE',    'NONE')

    call s:Hi('UserColourStatusDefault',   'NONE', 'NONE',    'NONE')
    call s:Hi('UserColourStatusBracket',   'bold', 'NONE',    'NONE')
    call s:Hi('UserColourStatusModeNormal','bold', 'Blue',    'NONE')
    call s:Hi('UserColourStatusModeInsert','bold', 'Green',   'NONE')
    call s:Hi('UserColourStatusModeReplace','bold','Red',     'NONE')
    call s:Hi('UserColourStatusModeVisual','bold', 'Magenta', 'NONE')
    call s:Hi('UserColourStatusModeOther', 'bold', 'NONE',    'NONE')
    call s:Hi('UserColourStatusBuffer',    'bold', 'Blue',    'NONE')
    call s:Hi('UserColourStatusOk',        'NONE', 'Green',   'NONE')
    call s:Hi('UserColourStatusFlag',      'bold', 'Red',     'NONE')
    call s:Hi('UserColourStatusPath',      'NONE', 'NONE',    'NONE')
    call s:Hi('UserColourStatusFileType',  'NONE', 'Magenta', 'NONE')
    call s:Hi('UserColourStatusInfo',      'NONE', 'NONE',    'NONE')
    call s:Hi('UserColourStatusPosition',  'NONE', 'Magenta', 'NONE')
    call s:Hi('UserColourStatusPercent',   'NONE', 'Blue',    'NONE')

    call s:Hi('UserColourTabDefault',      'NONE', 'NONE',    'NONE')
    call s:Hi('UserColourTabBracket',      'bold', 'NONE',    'NONE')
    call s:Hi('UserColourTabSelected',     'bold', 'Blue',    'NONE')
    call s:Hi('UserColourTabModified',     'NONE', 'Magenta', 'NONE')
    call s:Hi('UserColourTabFill',         'NONE', 'NONE',    'NONE')
endfunction
