"========================
" |\__   /|\ |  |\  |
" |   \   |  |  | \ | /|
" |    |  |  |  |   |/ |
" |    |  |  |  |      |
"========================

scriptencoding utf8


" Generate 1 to n
function! Rand(n)
  " http://vim-jp.org/vim-users-jp/2009/11/05/Hack-98.html
  let l:match_end = matchend(reltimestr(reltime()), '\d\+\.') + 1
  return reltimestr(reltime())[l:match_end : ] % (a:n + 1)
endfunction

" Big Sky :: vimでスクリプト内関数を書き換える http://mattn.kaoriya.net/software/vim/20090826003359.htm
function! GetScriptId(filename)
  let l:scriptnames = ''

  redir => l:scriptnames
  silent! scriptnames
  redir END

  let l:script_table = {}
  let l:head = '^\s*\(\d\+\):\s*\(.*\)$'
  for l:line in split(l:scriptnames, "\n")
    let l:script_table[tolower(substitute(l:line, l:head, '\2', ''))] = substitute(l:line, l:head, '\1', '')
  endfor

  return l:script_table[tolower(a:filename)]
endfunction
