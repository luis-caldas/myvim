" My simple Vim configuration

" Line numbers
set number relativenumber
set numberwidth=5

" Syntax highlighting
syntax enable

" Terminal palette colours only
set notermguicolors
if exists('+t_ut')
    set t_ut=
endif

" ASCII UI
set fillchars=vert:\|,fold:-,diff:-

" Mode display
set noshowmode

" Mouse support
set mouse=

" Command-line shortcuts
nnoremap q: <nop>
nnoremap Q <nop>

" Search
set hlsearch

" Column guide
set colorcolumn=80

" Folding
set foldmethod=marker

" Whitespace
augroup MineWhitespace
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

" Viminfo
let s:cache_dir = expand('~/.cache')
if !isdirectory(s:cache_dir)
    call mkdir(s:cache_dir, 'p', 0700)
endif
execute 'set viminfo+=n' . fnameescape(s:cache_dir . '/viminfo')

" Persistent undo
let s:undo_path = expand('~/.cache/vim/undo')
if !isdirectory(s:undo_path)
    call mkdir(s:undo_path, 'p', 0700)
endif
execute 'set undodir=' . fnameescape(s:undo_path)
set undofile

" Last position
augroup MineLastPosition
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line('$') && &filetype !~# 'commit'
        \ |   execute 'normal! g`"'
        \ | endif
augroup END

" Config path
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Plugin setup
execute 'source' fnameescape(s:path . '/plugins/config.vim')
call ConfigurePlugins()


" Colours
execute 'source' fnameescape(s:path . '/visual/colours.vim')
call SetColours()

" Status line
execute 'source' fnameescape(s:path . '/visual/lines/status.vim')
set statusline=%!StatusLine()

" Tab line
execute 'source' fnameescape(s:path . '/visual/lines/tab.vim')
set tabline=%!TabLine()

" List characters
set list
execute 'source' fnameescape(s:path . '/visual/listchars.vim')
execute 'set listchars=' . ListChars()
augroup MineListChars
    autocmd!
    autocmd VimEnter,WinEnter * call ListCharsColours()
augroup END

" Startup screen
execute 'source' fnameescape(s:path . '/visual/start.vim')
