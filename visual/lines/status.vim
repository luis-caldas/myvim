" Status line

set laststatus=2

function! Rs(prefix, name) abort
    return '%#' . a:prefix . a:name . '#'
endfunction

function! s:Block(prefix, group, text) abort
    return Rs(a:prefix, 'Bracket') . '['
        \ . Rs(a:prefix, a:group) . a:text
        \ . Rs(a:prefix, 'Bracket') . ']'
endfunction

function! StatusMode() abort
    let l:m = mode()

    if l:m ==# 'n' || l:m ==# 'no'
        return ['ModeNormal', 'NORMAL']
    elseif l:m =~# '^i'
        return ['ModeInsert', 'INSERT']
    elseif l:m =~# '^[Rr]'
        return ['ModeReplace', 'REPLACE']
    elseif l:m =~# '^[vV\x16sS]'
        return ['ModeVisual', 'VISUAL']
    endif

    return ['ModeOther', 'OTHER']
endfunction

function! StatusState() abort
    let l:flags = []

    if &modified
        call add(l:flags, '+')
    endif

    if &readonly
        call add(l:flags, 'RO')
    endif

    if &paste
        call add(l:flags, 'PASTE')
    endif

    if &spell
        call add(l:flags, 'SPELL')
    endif

    if empty(l:flags)
        return ['Ok', 'OK']
    endif

    return ['Flag', join(l:flags, ' ')]
endfunction

function! StatusFileEncoding() abort
    return empty(&fileencoding) ? &encoding : &fileencoding
endfunction

function! StatusFileInfo() abort
    return StatusFileEncoding() . ', ' . &fileformat
endfunction

function! StatusLine() abort
    let l:prefix = 'UserColourStatus'
    let l:mode = StatusMode()
    let l:state = StatusState()
    let l:filetype = empty(&filetype) ? '' : &filetype

    let l:s = ''

    let l:s .= s:Block(l:prefix, l:mode[0], l:mode[1])
    let l:s .= Rs(l:prefix, 'Default') . ' '
    let l:s .= s:Block(l:prefix, 'Buffer', '%n')
    let l:s .= Rs(l:prefix, 'Default') . ' '
    let l:s .= s:Block(l:prefix, l:state[0], l:state[1])
    let l:s .= Rs(l:prefix, 'Default') . ' '
    let l:s .= s:Block(l:prefix, 'Path', '%F')

    let l:s .= Rs(l:prefix, 'Default') . '%='

    if !empty(l:filetype)
        let l:s .= s:Block(l:prefix, 'FileType', l:filetype)
        let l:s .= Rs(l:prefix, 'Default') . ' '
    endif

    let l:s .= s:Block(l:prefix, 'Info', StatusFileInfo())
    let l:s .= Rs(l:prefix, 'Default') . ' '
    let l:s .= s:Block(l:prefix, 'Position', '%l:%c')
    let l:s .= Rs(l:prefix, 'Default') . ' '
    let l:s .= s:Block(l:prefix, 'Percent', '%p%%')

    return l:s
endfunction
