

let s:action = {
\   'is_selectable' : 1,
\ }

function! s:action.func(candidates)
  let l:path_list = map(a:candidates, 'v:val.word')
  let l:list_file = tempname()
  execute 'redir' '>' l:list_file
  silent! echo join(l:path_list, "\n")
  redir END
  echo system('cat ' . shellescape(l:list_file) . ' | grep -v "^$" | liname')
endfunction

call unite#custom#action('file', 'liname', s:action)
unlet s:action
