fun! Start()
    " Don't run if: we have commandline arguments, we don't have an empty
    " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
    if argc() || line2byte("$") != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif

    " Start a new buffer ...
    enew

    " ... and set some options for it
    setlocal bufhidden=wipe
    setlocal buftype=nofile
    setlocal nobuflisted
    setlocal nocursorcolumn
    setlocal nocursorline
    setlocal nolist
    setlocal nonumber
    setlocal noswapfile
    setlocal norelativenumber

    " String that will be shown in the startup
    call append("$", "")
    call append("$", "")
    call append("$", "")
    call append("$", "            .'.         .'.")
    call append("$", "            |  \\       /  |")
    call append("$", "            '.  \\  |  /  .'")
    call append("$", "              '. \\\\|// .'")
    call append("$", "                '-- --'         My simple VIM")
    call append("$", "                .'/|\\'.")
    call append("$", "               '..'|'..'")
    call append("$", "")
    call append("$", "")
    call append("$", "")
    call append("$", "")

    " No modifications to this buffer
    setlocal nomodifiable nomodified

    " When we go to insert mode start a new buffer, and start insert
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
endfun

" Run after "doing all the startup stuff"
autocmd VimEnter * call Start()
