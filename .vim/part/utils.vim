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

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! GetCharCode()
  " Get the output of :ascii
  redir => l:ascii
  silent! ascii
  redir END
  if match(l:ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let l:nrformat = '0x%02x'

  let l:encoding = (&fileencoding ==# '' ? &encoding : &fileencoding)

  if l:encoding ==# 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let l:nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [l:str, l:char, l:nr; l:rest] = matchlist(l:ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let l:nr = printf(l:nrformat, l:nr)

  return "'". l:char ."' ". l:nr
endfunction
