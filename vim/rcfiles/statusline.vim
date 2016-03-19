function! Mode()
    let l:mode = mode()

    if mode ==# "n"
      return "NORMAL"
    elseif mode ==# "i"
      return "INSERT"
    elseif mode ==# "R"
      return "REPLACE"
    elseif mode ==# "v"
      return "VISUAL"
    elseif mode ==# "V"
      return "V-LINE"
    elseif mode ==# "c"
      return "COMMAND"
    elseif mode ==# "\<C-v>"
      return "V-BLOCK"
    elseif mode ==# "s"
      return "SELECT"
    elseif mode ==# "S"
      return "S-LINE"
    else
      return l:mode
    endif
endfunction

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
  let file_name  = '%< %f'
  let file_type  = ' %Y '
  let git_branch = '%( %{GitBranch()} %)'
  let hunks      = '%( %{GitHunks()} %)'
  let position   = ' %2l:%-2c %P'
  let separator  = ' %= '
  let syntastic  = '%#ErrorMsg#%{SyntasticStatuslineFlag()}%*'
  let vim_mode   = ' %{Mode()} '

  return vim_mode.file_name.position.separator.file_type.git_branch.hunks.syntastic
endfunction

" Always show the status line
set laststatus=2

" Note that the "%!" expression is evaluated in the context of the current
" window and buffer. On the other hand, "%{}" items are evaluated in the context
" of the window that the statusline belongs to.
set statusline=%!BuildStatusLine()
