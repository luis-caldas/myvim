" Tab line

set showtabline=2

function! Rs(prefix, name) abort
    return '%#' . a:prefix . a:name . '#'
endfunction

function! s:TabName(tab_number) abort
    let l:winnr = tabpagewinnr(a:tab_number)
    let l:buflist = tabpagebuflist(a:tab_number)
    let l:bufnr = l:buflist[l:winnr - 1]
    let l:bufname = bufname(l:bufnr)
    let l:name = empty(l:bufname) ? '[No Name]' : fnamemodify(l:bufname, ':t')

    return substitute(l:name, '%', '%%', 'g')
endfunction

function! s:TabModified(tab_number) abort
    for l:bufnr in tabpagebuflist(a:tab_number)
        if getbufvar(l:bufnr, '&modified')
            return 1
        endif
    endfor

    return 0
endfunction

function! TabLine() abort
    let l:prefix = 'UserColourTab'
    let l:s = ''
    let l:selected_tab = tabpagenr()

    for l:tab_number in range(1, tabpagenr('$'))
        let l:name = s:TabName(l:tab_number)
        let l:modified = s:TabModified(l:tab_number)
        let l:text = l:tab_number . ' ' . l:name

        if l:tab_number == l:selected_tab
            let l:s .= Rs(l:prefix, 'Bracket') . '['
            let l:s .= Rs(l:prefix, 'Selected') . l:text
            if l:modified
                let l:s .= Rs(l:prefix, 'Default') . ' '
                let l:s .= Rs(l:prefix, 'Modified') . '+'
            endif
            let l:s .= Rs(l:prefix, 'Bracket') . ']'
        else
            let l:s .= Rs(l:prefix, 'Default') . ' ' . l:text
            if l:modified
                let l:s .= Rs(l:prefix, 'Default') . ' '
                let l:s .= Rs(l:prefix, 'Modified') . '+'
            endif
            let l:s .= Rs(l:prefix, 'Default') . ' '
        endif

        let l:s .= Rs(l:prefix, 'Default') . '  '
    endfor

    let l:s .= Rs(l:prefix, 'Fill') . '%='
    return l:s
endfunction
