
setlocal fileencoding=utf-8

function! s:AutoMessage()
  let l:branch_name = system('git rev-parse --abbrev-ref HEAD')
  let l:issue = matchstr(l:branch_name, 'issue/[0-9]\+')
  if l:issue != ''
    let l:issue_number = substitute(l:issue, '.*/', '', '')
    call append(0, 'fixes #' . l:issue_number . ' - ')
  endif
endfunction


call s:AutoMessage()
