" List characters

function! ListChars() abort
    return 'tab:>-,space:.,trail:-,nbsp:+,eol:$,extends:>,precedes:<'
endfunction

function! ListCharsColours() abort
    if exists('w:mine_listchars_match')
        silent! call matchdelete(w:mine_listchars_match)
    endif

    let w:mine_listchars_match = matchadd('UserColourLCharBase', '\\( \\|\t\\|\n\\)', -1)
endfunction
