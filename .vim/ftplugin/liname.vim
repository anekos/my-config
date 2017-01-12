
setlocal shiftwidth=8 tabstop=8
if filereadable(expand('~/local/script/liname/unite.vim'))
  source ~/local/script/liname/unite.vim
endif


function! s:LiNameCd(dir)
  let l:dir = substitute(a:dir, '\/$', '', '')
  for l:ln in range(1, line('$'))
    let l:line = getline(l:ln)
    call setline(l:ln, substitute(l:line, '\t', '\t' . l:dir . '/', ''))
  endfor
endfunction

command! -bar LiNameSort sort /^\d\+\t/
command! -nargs=1 -complete=dir LiNameCd call s:LiNameCd(<q-args>)
