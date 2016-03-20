if exists('g:loaded_statusline')
  finish
endif
let g:loaded_statusline = 1

" g:solarized_termcolors != 256 && &t_Co >= 16
let s:none    = "NONE"
let s:back    = "NONE"
let s:vmode   = "cterm"
let s:base03  = "8"
let s:base02  = "0"
let s:base01  = "10"
let s:base00  = "11"
let s:base0   = "12"
let s:base1   = "14"
let s:base2   = "7"
let s:base3   = "15"
let s:yellow  = "3"
let s:orange  = "9"
let s:red     = "1"
let s:magenta = "5"
let s:violet  = "13"
let s:blue    = "4"
let s:cyan    = "6"
let s:green   = "2"

exe "let s:bg_none      = ' ".s:vmode."bg=".s:none   ."'"
exe "let s:bg_back      = ' ".s:vmode."bg=".s:back   ."'"
exe "let s:bg_base03    = ' ".s:vmode."bg=".s:base03 ."'"
exe "let s:bg_base02    = ' ".s:vmode."bg=".s:base02 ."'"
exe "let s:bg_base01    = ' ".s:vmode."bg=".s:base01 ."'"
exe "let s:bg_base00    = ' ".s:vmode."bg=".s:base00 ."'"
exe "let s:bg_base0     = ' ".s:vmode."bg=".s:base0  ."'"
exe "let s:bg_base1     = ' ".s:vmode."bg=".s:base1  ."'"
exe "let s:bg_base2     = ' ".s:vmode."bg=".s:base2  ."'"
exe "let s:bg_base3     = ' ".s:vmode."bg=".s:base3  ."'"
exe "let s:bg_green     = ' ".s:vmode."bg=".s:green  ."'"
exe "let s:bg_yellow    = ' ".s:vmode."bg=".s:yellow ."'"
exe "let s:bg_orange    = ' ".s:vmode."bg=".s:orange ."'"
exe "let s:bg_red       = ' ".s:vmode."bg=".s:red    ."'"
exe "let s:bg_magenta   = ' ".s:vmode."bg=".s:magenta."'"
exe "let s:bg_violet    = ' ".s:vmode."bg=".s:violet ."'"
exe "let s:bg_blue      = ' ".s:vmode."bg=".s:blue   ."'"
exe "let s:bg_cyan      = ' ".s:vmode."bg=".s:cyan   ."'"

exe "let s:fg_none      = ' ".s:vmode."fg=".s:none   ."'"
exe "let s:fg_back      = ' ".s:vmode."fg=".s:back   ."'"
exe "let s:fg_base03    = ' ".s:vmode."fg=".s:base03 ."'"
exe "let s:fg_base02    = ' ".s:vmode."fg=".s:base02 ."'"
exe "let s:fg_base01    = ' ".s:vmode."fg=".s:base01 ."'"
exe "let s:fg_base00    = ' ".s:vmode."fg=".s:base00 ."'"
exe "let s:fg_base0     = ' ".s:vmode."fg=".s:base0  ."'"
exe "let s:fg_base1     = ' ".s:vmode."fg=".s:base1  ."'"
exe "let s:fg_base2     = ' ".s:vmode."fg=".s:base2  ."'"
exe "let s:fg_base3     = ' ".s:vmode."fg=".s:base3  ."'"
exe "let s:fg_green     = ' ".s:vmode."fg=".s:green  ."'"
exe "let s:fg_yellow    = ' ".s:vmode."fg=".s:yellow ."'"
exe "let s:fg_orange    = ' ".s:vmode."fg=".s:orange ."'"
exe "let s:fg_red       = ' ".s:vmode."fg=".s:red    ."'"
exe "let s:fg_magenta   = ' ".s:vmode."fg=".s:magenta."'"
exe "let s:fg_violet    = ' ".s:vmode."fg=".s:violet ."'"
exe "let s:fg_blue      = ' ".s:vmode."fg=".s:blue   ."'"
exe "let s:fg_cyan      = ' ".s:vmode."fg=".s:cyan   ."'"

exe "let s:fmt_none     = ' ".s:vmode."=NONE".          " term=NONE".    "'"

"let g:statusline_color_normal   = 'ctermfg=7   ctermbg=4   cterm=NONE'
let g:statusline_color_normal   = s:bg_blue.    s:fg_base3.   s:fmt_none
"let g:statusline_color_insert   = 'ctermfg=7   ctermbg=2   cterm=NONE'
let g:statusline_color_insert   = s:bg_green.   s:fg_base3.   s:fmt_none
"let g:statusline_color_replace  = 'ctermfg=7   ctermbg=67  cterm=NONE'
let g:statusline_color_replace  = s:bg_red.     s:fg_base3.   s:fmt_none
let g:statusline_color_visual   = 'ctermfg=5   ctermbg=53  cterm=NONE'
let g:statusline_color_position = 'ctermfg=15  ctermbg=0'
let g:statusline_color_modified = 'ctermfg=15  ctermbg=5'
let g:statusline_color_line     = 'ctermfg=207 ctermbg=0   cterm=bold'
let g:statusline_color_filetype = 'ctermfg=0   ctermbg=51  cterm=bold'
let g:statusline_separator      = '|'

" Set up the colors for the status bar
function! SetColorScheme()
  "exec 'hi User1 '.g:statusline_color_normal
  "exec 'hi User2 '.g:statusline_color_replace
  "exec 'hi User3 '.g:statusline_color_insert
  "exec 'hi User4 '.g:statusline_color_visual
  "exec 'hi User5 '.g:statusline_color_position
  "exec 'hi User6 '.g:statusline_color_modified
  "exec 'hi User7 '.g:statusline_color_line
  "exec 'hi User8 '.g:statusline_color_filetype
endfunc

function! Mode()
  " Screen must be redrawn so that the vim-mode color updates
  redraw

  let l:mode = mode()
  if mode ==# "n"
    exec 'hi User1 '.g:statusline_color_normal
    return "NORMAL"
  elseif mode ==# "i"
    exec 'hi User1 '.g:statusline_color_insert
    return "INSERT"
  elseif mode ==# "R" || mode ==# "r"
    exec 'hi User1 '.g:statusline_color_replace
    return "REPLACE"
  elseif mode ==# "v"
    exec 'hi User1 '.g:statusline_color_visual
    return "VISUAL"
  elseif mode ==# "V"
    exec 'hi User1 '.g:statusline_color_visual
    return "V-LINE"
  elseif mode ==# "\<C-v>"
    exec 'hi User1 '.g:statusline_color_visual
    return "V-BLOCK"
  else
    return l:mode
  endif
endfunc

" set up color scheme now
call SetColorScheme()

function! GitBranch()
  let l:head = fugitive#head()
    if empty(l:head)
      return ''
    else
      return "\ue0a0 ".l:head
    endif
endfunction

function! GitHunks()
  let hunks  = GitGutterGetHunkSummary()
  let string = ''

  if !empty(hunks)
    let hunk_symbols = ['+', '~', '-']

    for i in [0, 1, 2]
      if hunks[i] > 0
        let string .= printf('%s%s ', hunk_symbols[i], hunks[i])
      endif
    endfor
  endif
  return string
endfunction

function! BuildStatusLine()
  let file_name  = ' %{&readonly?"\ue0a2 ":""}%<%f '
  let file_type  = ' %Y '
  let git_branch = '%(%1* %{GitBranch()} %0*%)'
  let hunks      = '%( %{GitHunks()} %)'
  let position   = ' %4l:%-4c %P'
  let isModified = '%{&modified?"   [+]":""}'
  let separator  = ' %= '
  let syntastic  = '%#ErrorMsg#%{SyntasticStatuslineFlag()}%*'
  let vim_mode   = '%1* %{Mode()} %0*'

  return vim_mode.file_name.position.isModified.separator.file_type.git_branch.hunks.syntastic
endfunction

function! BuildStatusLine2()

  let &stl=""
  " mode (changes color)
  let &stl.="%1*\ %{Mode()} %0*"
  " session name
  let &stl.="%5* asd %0*"
  " file path
  let &stl.=" %<%F "
  " read only, modified, modifiable flags in brackets
  let &stl.="%([%R%M]%) "

  " right-aligh everything past this point
  let &stl.="%= "

  " readonly flag
  let &stl.="%(%{(&ro!=0?'(readonly)':'')} ".g:statusline_separator." %)"

  " file type (eg. python, ruby, etc..)
  let &stl.="%8*%( %{&filetype} %)%0* "
  " file format (eg. unix, dos, etc..)
  let &stl.="%{&fileformat} ".g:statusline_separator." "
  " file encoding (eg. utf8, latin1, etc..)
  let &stl.="%(%{(&fenc!=''?&fenc:&enc)} ".g:statusline_separator." %)"
  " buffer number
  let &stl.="BUF #%n "
  "line number (pink) / total lines
  let &stl.="%5*  LN %7*%-4.l%5*/%-4.L\ %0* "
  " percentage done
  let &stl.="(%-3.p%%) ".g:statusline_separator." "
  " column number (minimum width is 4)
  let &stl.="COL %-3.c "
  " modified / unmodified (purple)
  let &stl.="%(%6* %{&modified ? 'modified':''} %)"
endfunc

au InsertLeave  * redraw!
nmap _ds :call BuildStatusLine()<CR>
" Whenever the color scheme changes re-apply the colors
au ColorScheme * call SetColorScheme()
au ColorScheme,VimEnter * call BuildStatusLine()
" Always show the status line
set laststatus=2

" Note that the "%!" expression is evaluated in the context of the current
" window and buffer. On the other hand, "%{}" items are evaluated in the context
" of the window that the statusline belongs to.
set statusline=%!BuildStatusLine()
